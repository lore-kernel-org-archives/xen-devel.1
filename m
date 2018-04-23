From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] Input: xen-kbdfront - allow better
 run-time configuration
Date: Mon, 23 Apr 2018 11:55:30 -0700
Message-ID: <20180423185530.GC66646__42220.17998477$1524509655$gmane$org@dtor-ws>
References: <20180419133934.31306-1-andr2000@gmail.com>
 <998533bb-8042-b07e-cb79-661750e035d9@gmail.com>
 <a2189ec9-ef4d-2c23-28c6-a6ff8525e8e5@suse.com>
 <7b4c1f8a-6317-1f17-5950-64a1b7183dba@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1xdl=hm=gmail.com=dmitry.torokhov@srs-us1.protection.inumbo.net>)
 id 1fAgci-0003Aw-1h
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 18:55:36 +0000
Received: by mail-pf0-x241.google.com with SMTP id j5so10063856pfh.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Apr 2018 11:55:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <7b4c1f8a-6317-1f17-5950-64a1b7183dba@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMjMsIDIwMTggYXQgMTE6Mjk6NDVBTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMDQvMjMvMjAxOCAxMToyMyBBTSwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiA+IE9uIDIzLzA0LzE4IDEwOjAyLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToKPiA+ID4gSnVlcmdlbiwgSmFzb24sIERtaXRyeQo+ID4gPiBhbnkgY29tbWVudCBvbiB0aGlz
Pwo+ID4gT2xla3NhbmRyLCBwbGVhc2UgZ2l2ZSB1cyBzb21lIHRpbWUuIEkgY2FuJ3Qgc3BlYWsg
Zm9yIG90aGVycywgYnV0IEkgYW0KPiA+IG5vdCBzaXR0aW5nIGhlcmUgaWRsaW5nIGFuZCBob3Bp
bmcgdGhhdCBzb21lIHdvcmsgKGUuZy4gcGF0Y2hlcyB0bwo+ID4gcmV2aWV3KSBtaWdodCBhcHBl
YXIuCj4gPiAKPiA+IEkgaGF2ZSBhIGxvdCBvZiBvdGhlciBzdHVmZiB0byBkbyBhbmQgd2lsbCBy
ZXNwb25kIHdoZW4gSSBmaW5kIHNvbWUgdGltZQo+ID4gdG8gbG9vayBhdCB5b3VyIHBhdGNoZXMu
Cj4gPiAKPiA+IFBpbmdpbmcgb3RoZXJzIG9uIE1vbmRheSB3aGVuIGhhdmluZyBzZW50IG91dCB0
aGUgcGF0Y2ggb25seSBvbiBUaHVyc2RheQo+ID4gaXMgcmF0aGVyIHVuZnJpZW5kbHkuCj4gUmVh
bGx5IHNvcnJ5IGFib3V0IHRoaXMsIG15IGJhZC4KPiBJIGhhZCBhbiBpbXByZXNzaW9uIHRoYXQg
dGhlIG9ubHkgY2hhbmdlIHdlIG5lZWQgdG8KPiBkaXNjdXNzIHdhcyB1aW50IC0+IGJvb2wgY2hh
bmdlIHdoaWNoIHNlZW1lZCByYXRoZXIgdHJpdmlhbAoKSSBhbSBzb3JyeSBJIGRpZCBub3QgcmVz
cG9uZCB0byB0aGUgcHJldmlvdXMgdmVyc2lvbiB1bnRpbCB0b2RheSwgYnV0IEkKZG8gbm90IHRo
aW5rIHRoYXQgd2Ugc2hvdWxkIGJlIGV4dGVuZGluZyBtb2R1bGUgcGFyYW1ldGVycyBmb3IgdGhp
cy4KUHJvdG9jb2wgZmVhdHVyZXMgYXJlIGFscmVhZHkgdGhlcmUgZm9yIGFic29sdXRlIHBvaW50
ZXJzIGFuZAptdWx0aS10b3VjaCwga2V5Ym9hcmQgYW5kIHJlbGF0aXZlIHBvaW50ZXJzIHNob3Vs
ZCB1c2UgdGhlIHNhbWUKbWVjaGFuaXNtLgoKVGhhbmtzLgoKLS0gCkRtaXRyeQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
