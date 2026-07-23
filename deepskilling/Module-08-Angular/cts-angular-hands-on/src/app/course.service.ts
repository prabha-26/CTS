import { Injectable } from '@angular/core';
import { Course } from './course.model';

@Injectable({ providedIn: 'root' })
export class CourseService {
  private courses: Course[] = [
    { id: 1, title: '.NET FSE', technology: 'C#', duration: 40 },
    { id: 2, title: 'Angular Essentials', technology: 'Angular', duration: 24 },
    { id: 3, title: 'Web API', technology: 'ASP.NET Core', duration: 16 }
  ];

  getCourses(): Course[] {
    return [...this.courses];
  }

  addCourse(course: Omit<Course, 'id'>): void {
    const nextId = Math.max(...this.courses.map((item) => item.id)) + 1;
    this.courses.push({ id: nextId, ...course });
  }
}
