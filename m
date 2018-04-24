From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2] Input: xen-kbdfront - allow better
 run-time configuration
Date: Tue, 24 Apr 2018 09:05:18 +0300
Message-ID: <97f3a94f-f1d3-a162-c081-15f938eb7dd6__17590.279717888$1524549847$gmane$org@gmail.com>
References: <20180419133934.31306-1-andr2000@gmail.com>
 <998533bb-8042-b07e-cb79-661750e035d9@gmail.com>
 <a2189ec9-ef4d-2c23-28c6-a6ff8525e8e5@suse.com>
 <7b4c1f8a-6317-1f17-5950-64a1b7183dba@gmail.com>
 <20180423185530.GC66646@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yktx=hn=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fAr4u-0005Uk-0F
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 06:05:24 +0000
Received: by mail-lf0-x22a.google.com with SMTP id b23-v6so18448348lfg.4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Apr 2018 23:05:22 -0700 (PDT)
In-Reply-To: <20180423185530.GC66646@dtor-ws>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMjMvMjAxOCAwOTo1NSBQTSwgRG1pdHJ5IFRvcm9raG92IHdyb3RlOgo+IE9uIE1vbiwg
QXByIDIzLCAyMDE4IGF0IDExOjI5OjQ1QU0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOgo+PiBPbiAwNC8yMy8yMDE4IDExOjIzIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
Pj4gT24gMjMvMDQvMTggMTA6MDIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4+
IEp1ZXJnZW4sIEphc29uLCBEbWl0cnkKPj4+PiBhbnkgY29tbWVudCBvbiB0aGlzPwo+Pj4gT2xl
a3NhbmRyLCBwbGVhc2UgZ2l2ZSB1cyBzb21lIHRpbWUuIEkgY2FuJ3Qgc3BlYWsgZm9yIG90aGVy
cywgYnV0IEkgYW0KPj4+IG5vdCBzaXR0aW5nIGhlcmUgaWRsaW5nIGFuZCBob3BpbmcgdGhhdCBz
b21lIHdvcmsgKGUuZy4gcGF0Y2hlcyB0bwo+Pj4gcmV2aWV3KSBtaWdodCBhcHBlYXIuCj4+Pgo+
Pj4gSSBoYXZlIGEgbG90IG9mIG90aGVyIHN0dWZmIHRvIGRvIGFuZCB3aWxsIHJlc3BvbmQgd2hl
biBJIGZpbmQgc29tZSB0aW1lCj4+PiB0byBsb29rIGF0IHlvdXIgcGF0Y2hlcy4KPj4+Cj4+PiBQ
aW5naW5nIG90aGVycyBvbiBNb25kYXkgd2hlbiBoYXZpbmcgc2VudCBvdXQgdGhlIHBhdGNoIG9u
bHkgb24gVGh1cnNkYXkKPj4+IGlzIHJhdGhlciB1bmZyaWVuZGx5Lgo+PiBSZWFsbHkgc29ycnkg
YWJvdXQgdGhpcywgbXkgYmFkLgo+PiBJIGhhZCBhbiBpbXByZXNzaW9uIHRoYXQgdGhlIG9ubHkg
Y2hhbmdlIHdlIG5lZWQgdG8KPj4gZGlzY3VzcyB3YXMgdWludCAtPiBib29sIGNoYW5nZSB3aGlj
aCBzZWVtZWQgcmF0aGVyIHRyaXZpYWwKPiBJIGFtIHNvcnJ5IEkgZGlkIG5vdCByZXNwb25kIHRv
IHRoZSBwcmV2aW91cyB2ZXJzaW9uIHVudGlsIHRvZGF5LCBidXQgSQo+IGRvIG5vdCB0aGluayB0
aGF0IHdlIHNob3VsZCBiZSBleHRlbmRpbmcgbW9kdWxlIHBhcmFtZXRlcnMgZm9yIHRoaXMuCj4g
UHJvdG9jb2wgZmVhdHVyZXMgYXJlIGFscmVhZHkgdGhlcmUgZm9yIGFic29sdXRlIHBvaW50ZXJz
IGFuZAo+IG11bHRpLXRvdWNoLCBrZXlib2FyZCBhbmQgcmVsYXRpdmUgcG9pbnRlcnMgc2hvdWxk
IHVzZSB0aGUgc2FtZQo+IG1lY2hhbmlzbS4KT2ssIHRoZW4gSSdsbCBzdGFydCBmcm9tIGV4dGVu
ZGluZyB0aGUgcHJvdG9jb2wKPiBUaGFua3MuCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
