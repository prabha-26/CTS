import { Component, EventEmitter, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CreditLabelPipe } from '../../pipes/credit-label-pipe';
import { CourseService } from '../../services/course';


@Component({
  selector: 'app-course-list-test',
  standalone: true,
  imports: [
  CommonModule,
  CreditLabelPipe
],
  templateUrl: './course-list.html',
  styleUrl: './course-list.css'
})
export class CourseList {

  @Output() courseSelected = new EventEmitter<string>();
    courses: any[] = [];

constructor(private courseService: CourseService) {

  this.courseService.getCourses().subscribe({
    next: (data) => {
      console.log("Data received:", data);
      this.courses = data;
    },
    error: (err) => {
      console.error("HTTP Error:", err);
    }
  });

}
  selectCourse(course: string) {
    this.courseSelected.emit(course);
  }
}