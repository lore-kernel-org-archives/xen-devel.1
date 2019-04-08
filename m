From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v6 1/1] cameraif: add ABI for para-virtual
 camera
Date: Mon, 8 Apr 2019 09:16:57 +0300
Message-ID: <4fe07393-ad09-a2eb-474c-7b52bc188859@gmail.com>
References: <20190322073742.14639-1-andr2000@gmail.com>
 <20190322073742.14639-2-andr2000@gmail.com>
 <aa30b072-2ed2-beb6-39a2-94c1220f5d43@suse.com>
 <05d63963-e433-4e3b-5313-37befe4a572f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+VUF=SK=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hDNaY-0000mn-K7
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 06:17:02 +0000
Received: by mail-lj1-x242.google.com with SMTP id q66so10080550ljq.7
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2019 23:17:01 -0700 (PDT)
In-Reply-To: <05d63963-e433-4e3b-5313-37befe4a572f@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, koji.matsuoka.xm@renesas.com, hverkuil@xs4all.nl
List-Id: xen-devel@lists.xenproject.org

Ck9uIDQvMi8xOSA4OjM3IEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPiBPbiA0
LzEvMTkgOTozNSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMjIvMDMvMjAxOSAwODoz
NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Pgo+Pj4gVGhp
cyBpcyB0aGUgQUJJIGZvciB0aGUgdHdvIGhhbHZlcyBvZiBhIHBhcmEtdmlydHVhbGl6ZWQKPj4+
IGNhbWVyYSBkcml2ZXIgd2hpY2ggZXh0ZW5kcyBYZW4ncyByZWFjaCBtdWx0aW1lZGlhIGNhcGFi
aWxpdGllcyBldmVuCj4+PiBmYXJ0aGVyIGVuYWJsaW5nIGl0IGZvciB2aWRlbyBjb25mZXJlbmNp
bmcsIEluLVZlaGljbGUgSW5mb3RhaW5tZW50LAo+Pj4gaGlnaCBkZWZpbml0aW9uIG1hcHMgZXRj
Lgo+Pj4KPj4+IFRoZSBpbml0aWFsIGdvYWwgaXMgdG8gc3VwcG9ydCBtb3N0IG5lZWRlZCBmdW5j
dGlvbmFsaXR5IHdpdGggdGhlCj4+PiBmaW5hbCBpZGVhIHRvIG1ha2UgaXQgcG9zc2libGUgdG8g
ZXh0ZW5kIHRoZSBwcm90b2NvbCBpZiBuZWVkIGJlOgo+Pj4KPj4+IDEuIFByb3ZpZGUgbWVhbnMg
Zm9yIGJhc2UgdmlydHVhbCBkZXZpY2UgY29uZmlndXJhdGlvbjoKPj4+IMKgIC0gcGl4ZWwgZm9y
bWF0cwo+Pj4gwqAgLSByZXNvbHV0aW9ucwo+Pj4gwqAgLSBmcmFtZSByYXRlcwo+Pj4gMi4gU3Vw
cG9ydCBiYXNpYyBjYW1lcmEgY29udHJvbHM6Cj4+PiDCoCAtIGNvbnRyYXN0Cj4+PiDCoCAtIGJy
aWdodG5lc3MKPj4+IMKgIC0gaHVlCj4+PiDCoCAtIHNhdHVyYXRpb24KPj4+IDMuIFN1cHBvcnQg
c3RyZWFtaW5nIGNvbnRyb2wKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyAKPj4+IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4gUmV2aWV3
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBUaGFuayB5b3UsIGlzIGl0
IGdvb2QgZm9yIGluY2x1c2lvbiBpbiBYZW4/CnBpbmcKPj4KPj4gSnVlcmdlbgo+Pgo+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
