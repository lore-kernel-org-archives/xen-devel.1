From: Michael Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH RFC] ocaml: Fix compile with ocaml 4.06,
 use unsafe strings
Date: Sun, 28 Jan 2018 23:44:27 +0000 (GMT)
Message-ID: <alpine.LFD.2.21.1801281741180.4681@austen3.home>
References: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
 <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
 <DD256C43-6511-4327-A611-DDE1784764E7@citrix.com>
 <20180126114306.mpklwqjlworpuewf@citrix.com>
 <0079C722-DC8F-4930-8E85-42DAE5E8C979@citrix.com>
 <20180126120056.7sijtmdm53drvip2@citrix.com>
 <E618870F-03B7-4993-8975-E7BAB4767B2E@citrix.com>
 <1517009026.1156477.1249669224.5B9AA859@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4xlr=ex=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1efwcw-0001Dw-K7
 for xen-devel@lists.xenproject.org; Sun, 28 Jan 2018 23:44:46 +0000
In-Reply-To: <1517009026.1156477.1249669224.5B9AA859@webmail.messagingengine.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: John Thomson <git@johnthomson.fastmail.com.au>
Cc: Marcello Seri <marcello.seri@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNiBKYW4gMjAxOCwgSm9obiBUaG9tc29uIHdyb3RlOgoKPiBPbiBGcmksIDI2IEph
biAyMDE4LCBhdCAyMzoxNiwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToKPj4gdXNpbmcgdGhlIC11
bnNhZmUtc3RyaW5nIG9wdGlvbiAoaW50cm9kdWNlZCBpbiBPQ2FtbCA0LjAyKSB0byBrZWVwCj4+
IHN0cmluZ3MgbXV0YWJsZSB0byBhdm9pZCBjb2RlIGNoYW5nZXMgaXMgbm90IGdvaW5nIHRvIHdv
cmsgaW4gdGhlIGxvbmcKPj4gcnVuLgo+Cj4gT2theSwKPiBOQUsgbXkgdW5zYWZlLXN0cmluZyBw
YXRjaC4KPgo+IE9uIDI2LiBKYW4gMjAxOCwgYXQgMDk6MDksIE0gQSBZb3VuZyA8bS5hLnlvdW5n
QGR1cmhhbS5hYy51az4gd3JvdGU6Cj4+IFRoZSBwYXRjaCBpcyBhdAo+PiBodHRwczovL3NyYy5m
ZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL3hlbi9ibG9iL21hc3Rlci9mL3hlbi5vY2FtbC5zYWZlLXN0
cmluZ3MucGF0Y2gKPj4gd2l0aCB0aGUgcmVsYXRlZCBGZWRvcmEgYnVnIGF0Cj4+IGh0dHBzOi8v
YnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTUyNjcwMwo+Cj4gVGhlIHNhZmUt
c3RyaW5nIHBhdGNoIGlzIHRoZSBjb3JyZWN0IHdheSB0byBmaXggdGhpcyBwcm9ibGVtLgo+IEdl
dCB0aGF0IHBhdGNoIHNpZ25lZCBvZmYsIHN1Ym1pdHRlZCBhbmQgcmV2aWV3ZWQgaW4gYW5vdGhl
ciB0aHJlYWQ/Cj4gd2l0aCBhIGJ1bXAgdG8gNC4wMi4wIGluIHRvb2xzL2NvbmZpZ3VyZS5hYwo+
IEFYX0NPTVBBUkVfVkVSU0lPTihbJE9DQU1MVkVSU0lPTl0sIFtsdF0sIFszLjA5LjNdLCBbCj4g
aHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9dG9vbHMv
Y29uZmlndXJlLmFjO2g9ZDFhM2E3OGQ4N2NlMmYwNzdlNTUxYzZlZTAzOWNhYWQ0YWQyZWRjMTto
Yj1yZWZzL2hlYWRzL3N0YWdpbmcjbDI5Nwo+IFRoZSBwYXRjaCBhdXRob3IgYWdyZWVkIHRvIGhh
dmUgdGhlIHBhdGNoIHVwc3RyZWFtZWQgb24gdGhlIEZlZG9yYSBidWcgcmVwb3J0Lgo+IEhvdyBz
aG91bGQgdGhpcyB0aGVuIGJlIHNpZ25lZCBvZmYgYW5kIGF0dHJpYnV0ZWQ/CgpUaGUgcGF0Y2gg
YXR0YWNoZWQgdGhlIGJ1ZyByZXBvcnQgaXNuJ3QgdGhlIGNvbXBsZXRlIHBhdGNoLCBhcyBpdCB3
YXMgZG9uZSAKYWdhaW5zdCBhIHRlbXBvcmFyeSBidWlsZCBpbmNsdWRpbmcgYSBwYXRjaCBvZiB3
aGVyZSBJIGhhZCBnb3QgdG8gYmVmb3JlIApnZXR0aW5nIHN0dWNrIGFnYWluLgoKU28gSSBwYXRj
aGVkCnRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbApiYXNlZCBvbiBodHRwczovL2J1Z3pp
bGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE1MjY3MDMjYzMKYW5kIGFsc28KdG9vbHMv
b2NhbWwvbGlicy94Yi94Yi5tbAp0b29scy9vY2FtbC94ZW5zdG9yZWQvc3RkZXh0Lm1sCgpUaGUg
b3RoZXIgdHdvIGZpbGVzCnRvb2xzL29jYW1sL3hlbnN0b3JlZC9sb2dnaW5nLm1sCnRvb2xzL29j
YW1sL3hlbnN0b3JlZC91dGlscy5tbAphcmUgZnJvbSB0aGUgYnVnemlsbGEgcGF0Y2guCgo+IEkg
ZG8gbm90IGtub3cgaWYgY2FtbC1zdHViZG9tIHVzZXMgYW55IG9mIHRoZXNlIGZpbGVzLCBidXQg
aXQgc2VlbXMgdG8gdXNlIG9jYW1sLTMuMTEuMD8KPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj1zdHViZG9tL2NvbmZpZ3VyZTtoPWE3YTBjMDkxNTQ0
MGI3YjM1MWE3YWRmNGY0MGM4ZjllZThlNzM5ZWY7aGI9cmVmcy9oZWFkcy9zdGFnaW5nI2wzNTM0
CgpJZiB3ZSBjaGFuZ2UgdGhpcyBzaG91bGQgaXQgYmUgdGhlIGVhcmxpZXN0IHZlcnNpb24gdGhl
IGNvZGUgd2lsbCBzdXBwb3J0IAooNC4wMikgb3IgdGhlIGxhdGVzdCAoNC4wNik/CgogCU1pY2hh
ZWwgWW91bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
