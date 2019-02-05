From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v4 1/1] cameraif: add ABI for para-virtual
 camera
Date: Tue, 5 Feb 2019 15:06:48 +0200
Message-ID: <f3fa2587-3641-56ea-31c2-3758ee7ae96f@gmail.com>
References: <20190115093853.15495-1-andr2000@gmail.com>
 <20190115093853.15495-2-andr2000@gmail.com>
 <393f824d-e543-476c-777f-402bcc1c0bcb@xs4all.nl>
 <1152536e-9238-4192-653e-b784b34b8a0d@epam.com>
 <d8476f24-1952-e822-aa75-b8a5f5d5a552@gmail.com>
 <e5bbde8f-ef5a-791a-a3aa-645c57ddcf82@xs4all.nl>
 <d26401fd-9e16-548e-cfa0-af488a701b59@gmail.com>
 <3ea2c5a1-b5a1-ba70-ade5-d14cc3aace66@xs4all.nl>
 <08d6da1b-f061-010c-abf8-865564c26d49@gmail.com>
 <de3288c3-2f3a-152f-88f2-e8f2fe690493@xs4all.nl>
 <474636e0-8059-7b75-8b48-a216c6defaf4@gmail.com>
 <5679f9a9-1218-0cdb-0c61-45864159ab29@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gr0RB-0006K4-VO
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 13:06:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id v5so2574178lfe.7
 for <xen-devel@lists.xenproject.org>; Tue, 05 Feb 2019 05:06:52 -0800 (PST)
In-Reply-To: <5679f9a9-1218-0cdb-0c61-45864159ab29@xs4all.nl>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "jgross@suse.com" <jgross@suse.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "koji.matsuoka.xm@renesas.com" <koji.matsuoka.xm@renesas.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi81LzE5IDM6MDIgUE0sIEhhbnMgVmVya3VpbCB3cm90ZToKPiBPbiAyLzUvMTkgMTozMCBQ
TSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+PiBTb3JyeSBmb3IgcGF5aW5nIHNv
IG11Y2ggYXR0ZW50aW9uIHRvIHRoaXMsIGJ1dCBJIHRoaW5rIGl0IGlzIGltcG9ydGFudCB0aGF0
Cj4+PiB0aGlzIGlzIGRvY3VtZW50ZWQgcHJlY2lzZWx5Lgo+PiBUaGFuayB5b3UgZm9yIGhlbHBp
bmcgd2l0aCB0aGlzIC0geW91ciBjb21tZW50cyBhcmUgcmVhbGx5Cj4+IGltcG9ydGFudCBhbmQg
bWFrZSB0aGUgZGVzY3JpcHRpb24gcHJlY2lzZS4gT2ssIHNvIGZpbmFsbHk6Cj4+Cj4+ICDCoCog
bnVtX2J1ZnMgLSB1aW50OF90LCBkZXNpcmVkIG51bWJlciBvZiBidWZmZXJzIHRvIGJlIHVzZWQu
Cj4+ICDCoCoKPj4gIMKgKiBJZiBudW1fYnVmcyBpcyBub3QgemVybyB0aGVuIHRoZSBiYWNrZW5k
IHZhbGlkYXRlcyB0aGUgcmVxdWVzdGVkIG51bWJlciBvZgo+PiAgwqAqIGJ1ZmZlcnMgYW5kIHJl
c3BvbmRzIHdpdGggdGhlIG51bWJlciBvZiBidWZmZXJzIGFsbG93ZWQgZm9yIHRoaXMgZnJvbnRl
bmQuCj4+ICDCoCogRnJvbnRlbmQgaXMgcmVzcG9uc2libGUgZm9yIGNoZWNraW5nIHRoZSBjb3Jy
ZXNwb25kaW5nIHJlc3BvbnNlIGluIG9yZGVyIHRvCj4+ICDCoCogc2VlIGlmIHRoZSB2YWx1ZXMg
cmVwb3J0ZWQgYmFjayBieSB0aGUgYmFja2VuZCBkbyBtYXRjaCB0aGUgZGVzaXJlZCBvbmVzCj4+
ICDCoCogYW5kIGNhbiBiZSBhY2NlcHRlZC4KPj4gIMKgKiBGcm9udGVuZCBpcyBhbGxvd2VkIHRv
IHNlbmQgbXVsdGlwbGUgWEVOQ0FNRVJBX09QX0JVRl9SRVFVRVNUIHJlcXVlc3RzCj4+ICDCoCog
YmVmb3JlIHNlbmRpbmcgWEVOQ0FNRVJBX09QX1NUUkVBTV9TVEFSVCByZXF1ZXN0IHRvIHVwZGF0
ZSBvciB0dW5lIHRoZQo+PiAgwqAqIGZpbmFsIGNvbmZpZ3VyYXRpb24uCj4+ICDCoCogRnJvbnRl
bmQgaXMgbm90IGFsbG93ZWQgdG8gY2hhbmdlIHRoZSBudW1iZXIgb2YgYnVmZmVycyBhbmQvb3Ig
Y2FtZXJhCj4+ICDCoCogY29uZmlndXJhdGlvbiBhZnRlciB0aGUgc3RyZWFtaW5nIGhhcyBzdGFy
dGVkLgo+PiAgwqAqCj4+ICDCoCogSWYgbnVtX2J1ZnMgaXMgMCBhbmQgc3RyZWFtaW5nIGhhcyBu
b3Qgc3RhcnRlZCB5ZXQsIHRoZW4gdGhlIGJhY2tlbmQgbWF5Cj4+ICDCoCogZnJlZSBhbGwgcHJl
dmlvdXNseSBhbGxvY2F0ZWQgYnVmZmVycyAoaWYgYW55KSBvciBkbyBub3RoaW5nLgo+IEkgd291
bGQgcmVwaHJhc2UgdGhpczoKPgo+ICogSWYgbnVtX2J1ZnMgaXMgMCBhbmQgc3RyZWFtaW5nIGhh
cyBub3Qgc3RhcnRlZCB5ZXQsIHRoZW4gdGhlIGJhY2tlbmQgd2lsbAo+ICogZnJlZSBhbGwgcHJl
dmlvdXNseSBhbGxvY2F0ZWQgYnVmZmVycyAoaWYgYW55KS4KPgo+IFRoZSBwcmV2aW91cyB0ZXh0
IHN1Z2dlc3RlZCB0aGF0IHRoZSBiYWNrZW5kIG1pZ2h0IGNob29zZSBub3QgdG8gZnJlZQo+IHRo
ZSBhbGxvY2F0ZWQgYnVmZmVycywgYnV0IHRoYXQncyBub3QgdGhlIGNhc2UuCj4KT2ssIG1ha2Vz
IHNlbnNlCj4+ICDCoCogVHJ5aW5nIHRvIGNhbGwgdGhpcyBpZiBzdHJlYW1pbmcgaXMgaW4gcHJv
Z3Jlc3Mgd2lsbCByZXN1bHQgaW4gYW4gZXJyb3IuCj4+ICDCoCoKPj4gIMKgKiBJZiBjYW1lcmEg
cmVjb25maWd1cmF0aW9uIGlzIHJlcXVpcmVkIHRoZW4gdGhlIHN0cmVhbWluZyBtdXN0IGJlIHN0
b3BwZWQKPj4gIMKgKiBhbmQgdGhpcyByZXF1ZXN0IG11c3QgYmUgc2VudCB3aXRoIG51bV9idWZz
IHNldCB0byB6ZXJvIGFuZCBmaW5hbGx5Cj4+ICDCoCogYnVmZmVycyBkZXN0cm95ZWQuCj4+ICDC
oCoKPj4gIMKgKiBQbGVhc2Ugbm90ZSwgdGhhdCB0aGUgbnVtYmVyIG9mIGJ1ZmZlcnMgaW4gdGhp
cyByZXF1ZXN0IG11c3Qgbm90IGV4Y2VlZAo+PiAgwqAqIHRoZSB2YWx1ZSBjb25maWd1cmVkIGlu
IFhlblN0b3JlLm1heC1idWZmZXJzLgo+PiAgwqAqCj4+ICDCoCogU2VlIHJlc3BvbnNlIGZvcm1h
dCBmb3IgdGhpcyByZXF1ZXN0Lgo+IFdpdGggdGhhdCBzbWFsbCBjaGFuZ2UgdGhlIHRleHQgbG9v
a3MgZ29vZCB0byBtZS4KVGhhbmsgeW91IGZvciB5b3VyIHRpbWUgYW5kIGhlbHAgd2l0aCB0aGlz
IQpJdCBzZWVtcyBJIGNhbiBwdXNoIHY1IGZvciB0aGUgKGZpbmFsPykgcmV2aWV3IHRoZW4KPiBS
ZWdhcmRzLAo+Cj4gCUhhbnMKVGhhbmsgeW91LApPbGVrc2FuZHIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
