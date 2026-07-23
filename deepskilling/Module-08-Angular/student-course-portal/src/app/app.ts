import { Component, signal } from '@angular/core';

import { Header } from './components/header/header';
import { Home } from './components/home/home';
import { CourseList } from './components/course-list/course-list';
import { StudentProfile } from './components/student-profile/student-profile';
import { RouterOutlet } from '@angular/router';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
  Header,
  RouterOutlet
],
  
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('student-course-portal');

}