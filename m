From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] xen: Fix x86 sched_clock() interface for
 xen
Date: Tue, 15 Jan 2019 12:03:48 +0100
Message-ID: <a50d1213-2390-14f1-fe78-e8058266978c__3398.25405176288$1547550167$gmane$org@suse.com>
References: <20190114124413.3742-1-jgross@suse.com>
 <alpine.DEB.2.21.1901151142590.1865@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=93tI=PX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjMVd-0005o2-4A
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:03:53 +0000
In-Reply-To: <alpine.DEB.2.21.1901151142590.1865@nanos.tec.linutronix.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, hans@knorrie.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAxMTo0MywgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9uIE1vbiwgMTQg
SmFuIDIwMTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gCj4+IENvbW1pdCBmOTRjOGQxMTY5OTc1
OSAoInNjaGVkL2Nsb2NrLCB4ODYvdHNjOiBSZXdvcmsgdGhlIHg4NiAndW5zdGFibGUnCj4+IHNj
aGVkX2Nsb2NrKCkgaW50ZXJmYWNlIikgYnJva2UgWGVuIGd1ZXN0IHRpbWUgaGFuZGxpbmcgYWNy
b3NzCj4+IG1pZ3JhdGlvbjoKPj4KPj4gWyAgMTg3LjI0OTk1MV0gRnJlZXppbmcgdXNlciBzcGFj
ZSBwcm9jZXNzZXMgLi4uIChlbGFwc2VkIDAuMDAxIHNlY29uZHMpIGRvbmUuCj4+IFsgIDE4Ny4y
NTExMzddIE9PTSBraWxsZXIgZGlzYWJsZWQuCj4+IFsgIDE4Ny4yNTExMzddIEZyZWV6aW5nIHJl
bWFpbmluZyBmcmVlemFibGUgdGFza3MgLi4uIChlbGFwc2VkIDAuMDAxIHNlY29uZHMpIGRvbmUu
Cj4+IFsgIDE4Ny4yNTIyOTldIHN1c3BlbmRpbmcgeGVuc3RvcmUuLi4KPj4gWyAgMTg3LjI2Njk4
N10geGVuOmdyYW50X3RhYmxlOiBHcmFudCB0YWJsZXMgdXNpbmcgdmVyc2lvbiAxIGxheW91dAo+
PiBbMTg0NDY3NDM4MTEuNzA2NDc2XSBPT00ga2lsbGVyIGVuYWJsZWQuCj4+IFsxODQ0Njc0Mzgx
MS43MDY0NzhdIFJlc3RhcnRpbmcgdGFza3MgLi4uIGRvbmUuCj4+IFsxODQ0Njc0MzgxMS43MjA1
MDVdIFNldHRpbmcgY2FwYWNpdHkgdG8gMTY3NzcyMTYKPiAKPiBJIHNlZSB0aGF0IGl0J3MgYnJv
a2VuLCBidXQgdGhlIGNoYW5nZWxvZyBjb3VsZCBkbyB3aXRoIGFuIGV4cGxhbmF0aW9uIFdIWQo+
IGl0IGJyb2tlLgoKVGhpcyBzZWVtcyB0byBiZSByYXRoZXIgY29tcGxleC4KCkkgYmVsaWV2ZSB0
aGUgbWVudGlvbmVkIGNvbW1pdCBqdXN0IGlnbm9yZWQgWGVuIGd1ZXN0cyByZXN1bHRpbmcgaW4g
YQoic3RhYmxlIiBjbG9jayB3aGVyZSBpdCBzaG91bGRuJ3QsIGJ1dCBtYXliZSBJIGhhdmUgbWlz
c2VkIGFub3RoZXIKYXNwZWN0IG9mIHRoaXMgY29tbWl0IHdoaWNoIGlzIHRvIGJsYW1lLiBJIHRy
aWVkIHRvIGZpeCB0aGF0IGJ5CnJlcGxhY2luZyB1c2luZ19uYXRpdmVfc2NoZWRfY2xvY2soKSB3
aXRoIGEgaHlwZXJ2aXNvciBzcGVjaWZpYyBwdm9wcwpmdW5jdGlvbi4KClVuZm9ydHVuYXRlbHkg
dGhpcyBkaWRuJ3Qgd29yaywgbWF5YmUgZHVlIHRvIG90aGVyIHVzZXMgb2YKdXNpbmdfbmF0aXZl
X3NjaGVkX2Nsb2NrKCkgYWRkZWQgYnkgbGF0ZXIgcGF0Y2hlcy4gSW4gdGhlIGVuZCBpdCB3YXMK
cXVpdGUgY2xlYXIgdGhhdCB1cGRhdGluZyB0aGUgWGVuIGNsb2NrIG9mZnNldCB3YXMgdGhlIHJp
Z2h0IHRoaW5nIHRvCmRvLCBzbyBJIGVuZGVkIHVwIHdpdGggdGhpcyBwYXRjaC4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
