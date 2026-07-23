import { Component } from '@angular/core';
import { NgFor } from '@angular/common';
import { CourseService } from './course.service';

@Component({
  selector: 'app-course-list',
  standalone: true,
  imports: [NgFor],
  template: `
    <section>
      <h2>Available Courses</h2>
      <article *ngFor="let course of courses">
        <h3>{{ course.title }}</h3>
        <p>{{ course.technology }} | {{ course.duration }} hours</p>
      </article>
    </section>
  `,
  styles: [`
    h2 { margin-top: 0; }
    article { background: white; border: 1px solid #d9e2ec; border-radius: 8px; margin-bottom: 12px; padding: 16px; }
    h3 { margin: 0 0 6px; }
    p { margin: 0; }
  `]
})
export class CourseListComponent {
  courses = this.courseService.getCourses();

  constructor(private readonly courseService: CourseService) {}
}
