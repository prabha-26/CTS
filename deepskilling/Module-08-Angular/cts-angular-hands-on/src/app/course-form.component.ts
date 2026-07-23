import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { CourseService } from './course.service';

@Component({
  selector: 'app-course-form',
  standalone: true,
  imports: [FormsModule],
  template: `
    <form (ngSubmit)="save()">
      <label>Title <input name="title" [(ngModel)]="title" required></label>
      <label>Technology <input name="technology" [(ngModel)]="technology" required></label>
      <label>Duration <input name="duration" type="number" [(ngModel)]="duration" min="1" required></label>
      <button type="submit">Save</button>
    </form>
  `,
  styles: [`
    form { display: grid; gap: 14px; max-width: 420px; background: white; border: 1px solid #d9e2ec; border-radius: 8px; padding: 18px; }
    label { display: grid; gap: 6px; font-weight: 700; }
    input { padding: 10px; border: 1px solid #b8c2cc; border-radius: 6px; }
    button { width: fit-content; padding: 10px 18px; border: 0; border-radius: 6px; color: white; background: #0f766e; cursor: pointer; }
  `]
})
export class CourseFormComponent {
  title = '';
  technology = '';
  duration = 8;

  constructor(
    private readonly courseService: CourseService,
    private readonly router: Router
  ) {}

  save(): void {
    this.courseService.addCourse({
      title: this.title,
      technology: this.technology,
      duration: Number(this.duration)
    });
    this.router.navigateByUrl('/');
  }
}
