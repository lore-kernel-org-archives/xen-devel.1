From: John Thomson <git@johnthomson.fastmail.com.au>
Subject: Re: [PATCH RFC] ocaml: Fix compile with ocaml 4.06,
 use unsafe strings
Date: Sat, 27 Jan 2018 09:23:46 +1000
Message-ID: <1517009026.1156477.1249669224.5B9AA859@webmail.messagingengine.com>
References: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
 <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
 <DD256C43-6511-4327-A611-DDE1784764E7@citrix.com>
 <20180126114306.mpklwqjlworpuewf@citrix.com>
 <0079C722-DC8F-4930-8E85-42DAE5E8C979@citrix.com>
 <20180126120056.7sijtmdm53drvip2@citrix.com>
 <E618870F-03B7-4993-8975-E7BAB4767B2E@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vepn=ev=johnthomson.fastmail.com.au=git@srs-us1.protection.inumbo.net>)
 id 1efDLf-0005Tz-1K
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 23:23:55 +0000
In-Reply-To: <E618870F-03B7-4993-8975-E7BAB4767B2E@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Marcello Seri <marcello.seri@citrix.com>, M A Young <m.a.young@durham.ac.uk>, Wei Liu <wei.liu2@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNiBKYW4gMjAxOCwgYXQgMjM6MTYsIENocmlzdGlhbiBMaW5kaWcgd3JvdGU6Cj4g
dXNpbmcgdGhlIC11bnNhZmUtc3RyaW5nIG9wdGlvbiAoaW50cm9kdWNlZCBpbiBPQ2FtbCA0LjAy
KSB0byBrZWVwIAo+IHN0cmluZ3MgbXV0YWJsZSB0byBhdm9pZCBjb2RlIGNoYW5nZXMgaXMgbm90
IGdvaW5nIHRvIHdvcmsgaW4gdGhlIGxvbmcgCj4gcnVuLgoKT2theSwKTkFLIG15IHVuc2FmZS1z
dHJpbmcgcGF0Y2guCgpPbiAyNi4gSmFuIDIwMTgsIGF0IDA5OjA5LCBNIEEgWW91bmcgPG0uYS55
b3VuZ0BkdXJoYW0uYWMudWs+IHdyb3RlOgo+IFRoZSBwYXRjaCBpcyBhdAo+IGh0dHBzOi8vc3Jj
LmZlZG9yYXByb2plY3Qub3JnL3JwbXMveGVuL2Jsb2IvbWFzdGVyL2YveGVuLm9jYW1sLnNhZmUt
c3RyaW5ncy5wYXRjaAo+IHdpdGggdGhlIHJlbGF0ZWQgRmVkb3JhIGJ1ZyBhdAo+IGh0dHBzOi8v
YnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTUyNjcwMwoKVGhlIHNhZmUtc3Ry
aW5nIHBhdGNoIGlzIHRoZSBjb3JyZWN0IHdheSB0byBmaXggdGhpcyBwcm9ibGVtLgpHZXQgdGhh
dCBwYXRjaCBzaWduZWQgb2ZmLCBzdWJtaXR0ZWQgYW5kIHJldmlld2VkIGluIGFub3RoZXIgdGhy
ZWFkPwp3aXRoIGEgYnVtcCB0byA0LjAyLjAgaW4gdG9vbHMvY29uZmlndXJlLmFjCkFYX0NPTVBB
UkVfVkVSU0lPTihbJE9DQU1MVkVSU0lPTl0sIFtsdF0sIFszLjA5LjNdLCBbCmh0dHBzOi8veGVu
Yml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXRvb2xzL2NvbmZpZ3VyZS5h
YztoPWQxYTNhNzhkODdjZTJmMDc3ZTU1MWM2ZWUwMzljYWFkNGFkMmVkYzE7aGI9cmVmcy9oZWFk
cy9zdGFnaW5nI2wyOTcKVGhlIHBhdGNoIGF1dGhvciBhZ3JlZWQgdG8gaGF2ZSB0aGUgcGF0Y2gg
dXBzdHJlYW1lZCBvbiB0aGUgRmVkb3JhIGJ1ZyByZXBvcnQuCkhvdyBzaG91bGQgdGhpcyB0aGVu
IGJlIHNpZ25lZCBvZmYgYW5kIGF0dHJpYnV0ZWQ/CgoKSSBkbyBub3Qga25vdyBpZiBjYW1sLXN0
dWJkb20gdXNlcyBhbnkgb2YgdGhlc2UgZmlsZXMsIGJ1dCBpdCBzZWVtcyB0byB1c2Ugb2NhbWwt
My4xMS4wPwpodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7
Zj1zdHViZG9tL2NvbmZpZ3VyZTtoPWE3YTBjMDkxNTQ0MGI3YjM1MWE3YWRmNGY0MGM4ZjllZThl
NzM5ZWY7aGI9cmVmcy9oZWFkcy9zdGFnaW5nI2wzNTM0CgpDaGVlcnMsCi0tCiAgSm9obiBUaG9t
c29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
