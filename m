From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen/time: fix section mismatch for
 xen_init_time_ops()
Date: Mon, 8 Jan 2018 09:49:14 -0500
Message-ID: <e52a431f-7787-4139-e966-5dddd53ef993__23319.1943647855$1515422918$gmane$org@oracle.com>
References: <1514083813-27047-1-git-send-email-nick.desaulniers@gmail.com>
 <52b547c5-509a-3a82-12cd-4d9d0a06b53f@oracle.com>
 <d5314269-6d7e-d496-695f-af59bc41f554@suse.com>
 <87e3dc74-5959-1ecf-6854-fda017c2c775@citrix.com>
 <6c82c574-6810-1003-183c-44f79ae7554f@oracle.com>
 <CAH7mPviNpb4Gtm95=D1n4L90NSUCJO2ihOvRGQuEBNEHFyZ8Zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fog3=ed=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eYYk4-0000NK-L3
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 14:49:36 +0000
In-Reply-To: <CAH7mPviNpb4Gtm95=D1n4L90NSUCJO2ihOvRGQuEBNEHFyZ8Zg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDYvMjAxOCAwMzozNSBQTSwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPiBPbiBUdWUs
IEphbiAyLCAyMDE4IGF0IDc6MDAgQU0sIEJvcmlzIE9zdHJvdnNreQo+IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IE9uIDAxLzAyLzIwMTggMDk6MzIgQU0sIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAwMi8wMS8xOCAxNDoyNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBPbiAwMi8wMS8xOCAxNToxOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+PiBPbiAx
Mi8yMy8yMDE3IDA5OjUwIFBNLCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+Pj4+Pj4gVGhlIGhl
YWRlciBkZWNsYXJlcyB0aGlzIGZ1bmN0aW9uIGFzIF9faW5pdCBidXQgaXMgZGVmaW5lZCBpbiBf
X3JlZgo+Pj4+Pj4gc2VjdGlvbi4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIERl
c2F1bG5pZXJzIDxuaWNrLmRlc2F1bG5pZXJzQGdtYWlsLmNvbT4KPj4+Pj4gQUZBSUsgc2VjdGlv
biBhdHRyaWJ1dGVzIGluIGhlYWRlciBmaWxlcyBhcmUgaWdub3JlZCBieSBjb21waWxlciBhbnl3
YXkKPj4+Pj4gc28gSSdkIHJlbW92ZSBhbGwgb2YgdGhlbS4KPj4+PiBIbW0sIEknbSBub3Qgc3Vy
ZSBhbGwgZnV0dXJlIGNvbXBpbGVycyB3aWxsIGlnbm9yZSB0aGUgc2VjdGlvbgo+Pj4+IGF0dHJp
YnV0ZXMuIGluY2x1ZGUvbGludXgvaW5pdC5oIGV4cGxpY3RpbHkgbWVudGlvbnMgd2hlcmUgdG8g
cHV0Cj4+Pj4gdGhlIGF0dHJ1YnV0ZSBpbiBhIHByb3RvdHlwZSwgc28gSSdkIHJhdGhlciBrZWVw
IGl0Lgo+Pj4gQXR0cmlidXRlcyBpbiB0aGUgZGVjbGFyYXRpb24gYXJlIGZvciBzdGF0aWMgYW5h
bHlzaXMgdG9vbHMgc3VjaCBhcyBzcGFyc2UuCj4+Pgo+Pj4gSG93IGVsc2UgYXJlIHlvdSBnb2lu
ZyB0byB3b3JrIG91dCB3aGV0aGVyIGEgc2VjdGlvbiBtaXNtYXRjaCBoYXMgb2NjdXJyZWQ/Cj4+
IElzbid0IHRoaXMgZG9uZSBiYXNlZCBvbiBkZWZpbml0aW9ucz8KPj4KPj4gVG9ucyBvZiBfX2lu
aXQgcm91dGluZXMgZG9uJ3QgaGF2ZSB0aGUgYXR0cmlidXRlIHNwZWNpZmllZCBpbiBoZWFkZXIK
Pj4gZmlsZXMuIEluIGZhY3QsIGV2ZW4gaW4gdGhpcyBmaWxlIChhcmNoL3g4Ni94ZW4veGVuLW9w
cy5oKSB0aGVyZSBhcmUKPj4gc29tZSB0aGF0IGRvbid0IGhhdmUgaXQuCj4+Cj4+IC1ib3Jpcwo+
IFdoYXQgYXJlIHRoZSBuZXh0IHN0ZXBzIGZvciBnZXR0aW5nIHRoaXMgcGF0Y2ggbWVyZ2VkPyBU
aGlzIGlzIHRoZQo+IG9ubHkgZnVuY3Rpb24gZm9yIHdoaWNoIEkgZ2V0IGEgY29tcGlsZXIgd2Fy
bmluZyAod2l0aCBDbGFuZykuICBEbyB5b3UKPiByZXF1aXJlIGEgcGF0Y2ggaW5zdGVhZCB0aGF0
IGNoYW5nZXMgbW9yZSBmdW5jdGlvbiBhdHRyaWJ1dGVzLCBvciBjYW4KPiB0aGF0IGJlIGEgZm9s
bG93IHVwIHBhdGNoPwoKQXBwbGllZCB0byBmb3ItbGludXMtNC4xNS4KCi1ib3JpcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
