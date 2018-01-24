From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Wed, 24 Jan 2018 11:38:36 -0500
Message-ID: <af9d4bcb-9e99-f6cd-491e-c084f9de05a5@oracle.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <cfa0d19b-ace7-4d41-7889-ec9ff6eef85a@suse.com>
 <20180118103330.6ampgvc5ovejzyfp@citrix.com>
 <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
 <CAFLBxZYaoUzqH4OGnn56qjX8KzAWWSVJqToWqRLncVC+kLxvZg@mail.gmail.com>
 <20180124105453.xlaech23qkl6ebni@MacBook-Pro-de-Roger.local>
 <ee015869-6b7d-c12a-4f2f-266c8bccb2d8@suse.com>
 <fc33fe29-9e99-56e5-e064-7fefd28f7fe7@oracle.com>
 <CAFLBxZb=a3wC_i49FJ2sk3g73p6WQxyGR_qBR2P3rNu-4-7QgQ@mail.gmail.com>
 <dbf149c4-15f1-9374-0eb5-7317d9c6f76e@suse.com>
 <CAFLBxZYLBLbvEk2LRuT6U1vNSyUoam+vT_AR4CLEtc8oB1Qewg@mail.gmail.com>
 <b5a88b65-0cbe-a522-4b95-524343897bcf@oracle.com>
 <b03f0271-c584-19e9-98a5-f3a3dab17ff5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kpe7=et=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eeO4W-0005ST-5U
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 16:38:48 +0000
In-Reply-To: <b03f0271-c584-19e9-98a5-f3a3dab17ff5@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjQvMjAxOCAxMToxNSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNC8wMS8x
OCAxNzoxMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Cj4+Cj4+Pj4gU28gd2hhdCBpcyB0aGUg
cHJvYmxlbSBoZXJlPwo+Pj4+Cj4+Pj4gLSBjdXJyZW50IExpbnV4IGNhbid0IGJlIGJvb3RlZCBh
cyBQVkggZ3Vlc3Qgd2l0aCB4ZW4tdW5zdGFibGUgZHVlIHRvCj4+Pj4gICBhIGJ1ZyBpbiBMaW51
eCwgcGF0Y2hlcyBmb3IgTGludXggYXJlIGJlaW5nIHdvcmtlZCBvbgo+PiBJIHdvdWxkIHByZWZl
ciBmb3IgcGF0Y2hlcyB0byBmaXJzdCBzaG93IHVwIGluIExpbnV4LiBPdGhlcndpc2Ugd2Ugd2ls
bAo+PiBiZSBhZGRpbmcgWGVuIGNvZGUgd2l0aG91dCBhbnkgbWVhbnMgdG8gdGVzdCBpdCB3aXRo
IFBWSCBndWVzdHMuIEFuZAo+PiB0aGVuLCB3aGVuIExpbnV4IGRvZXMgZ2V0IHByb3BlciBSU0RQ
IHN1cHBvcnQgZm9yIFBWSCBhbmQgdHJpZXMgdG8gYm9vdCwKPj4gd2UgbWF5IGRpc2NvdmVyIHRo
YXQgYWxsIHNvcnRzIG9mIHVucmVsYXRlZCB0aGluZ3MgYXJlIGJyb2tlbi4KPiBJIHdhbnRlZCB0
byBkbyBpdCB0aGlzIHdheS4KPgo+IE15IExpbnV4IHBhdGNoZXMgd2VyZSBhY2NlcHRlZCBmb3Ig
NC4xNiBhbmQgb25seSB0aGVuIEkgc2VudCB0aGUgWGVuCj4gcGF0Y2hlcy4gVW5mb3J0dW5hdGVs
eSB0aGUgZ3J1YjIgYnVnIHJlc3VsdGVkIGluIHRoZSBMaW51eCBwYXRjaGVzIGJlaW5nCj4gcHV0
IG9uIGhvbGQuCgoKQW5kIHVudGlsIHRoaXMgaXMgYWxsIHJlc29sdmVkIHdlIHNob3VsZCByZXZl
cnQgdGhpcyBwYXRjaC4KCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
