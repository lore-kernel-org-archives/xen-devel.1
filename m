From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v4 1/1] cameraif: add ABI for para-virtual
 camera
Date: Tue, 5 Feb 2019 14:02:34 +0100
Message-ID: <5679f9a9-1218-0cdb-0c61-45864159ab29@xs4all.nl>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O9iZ=QM=xs4all.nl=hverkuil@srs-us1.protection.inumbo.net>)
 id 1gr0N7-0006AU-Bw
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 13:02:41 +0000
In-Reply-To: <474636e0-8059-7b75-8b48-a216c6defaf4@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "jgross@suse.com" <jgross@suse.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "koji.matsuoka.xm@renesas.com" <koji.matsuoka.xm@renesas.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi81LzE5IDE6MzAgUE0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBTb3Jy
eSBmb3IgcGF5aW5nIHNvIG11Y2ggYXR0ZW50aW9uIHRvIHRoaXMsIGJ1dCBJIHRoaW5rIGl0IGlz
IGltcG9ydGFudCB0aGF0Cj4+IHRoaXMgaXMgZG9jdW1lbnRlZCBwcmVjaXNlbHkuCj4gVGhhbmsg
eW91IGZvciBoZWxwaW5nIHdpdGggdGhpcyAtIHlvdXIgY29tbWVudHMgYXJlIHJlYWxseQo+IGlt
cG9ydGFudCBhbmQgbWFrZSB0aGUgZGVzY3JpcHRpb24gcHJlY2lzZS4gT2ssIHNvIGZpbmFsbHk6
Cj4gCj4gwqAqIG51bV9idWZzIC0gdWludDhfdCwgZGVzaXJlZCBudW1iZXIgb2YgYnVmZmVycyB0
byBiZSB1c2VkLgo+IMKgKgo+IMKgKiBJZiBudW1fYnVmcyBpcyBub3QgemVybyB0aGVuIHRoZSBi
YWNrZW5kIHZhbGlkYXRlcyB0aGUgcmVxdWVzdGVkIG51bWJlciBvZgo+IMKgKiBidWZmZXJzIGFu
ZCByZXNwb25kcyB3aXRoIHRoZSBudW1iZXIgb2YgYnVmZmVycyBhbGxvd2VkIGZvciB0aGlzIGZy
b250ZW5kLgo+IMKgKiBGcm9udGVuZCBpcyByZXNwb25zaWJsZSBmb3IgY2hlY2tpbmcgdGhlIGNv
cnJlc3BvbmRpbmcgcmVzcG9uc2UgaW4gb3JkZXIgdG8KPiDCoCogc2VlIGlmIHRoZSB2YWx1ZXMg
cmVwb3J0ZWQgYmFjayBieSB0aGUgYmFja2VuZCBkbyBtYXRjaCB0aGUgZGVzaXJlZCBvbmVzCj4g
wqAqIGFuZCBjYW4gYmUgYWNjZXB0ZWQuCj4gwqAqIEZyb250ZW5kIGlzIGFsbG93ZWQgdG8gc2Vu
ZCBtdWx0aXBsZSBYRU5DQU1FUkFfT1BfQlVGX1JFUVVFU1QgcmVxdWVzdHMKPiDCoCogYmVmb3Jl
IHNlbmRpbmcgWEVOQ0FNRVJBX09QX1NUUkVBTV9TVEFSVCByZXF1ZXN0IHRvIHVwZGF0ZSBvciB0
dW5lIHRoZQo+IMKgKiBmaW5hbCBjb25maWd1cmF0aW9uLgo+IMKgKiBGcm9udGVuZCBpcyBub3Qg
YWxsb3dlZCB0byBjaGFuZ2UgdGhlIG51bWJlciBvZiBidWZmZXJzIGFuZC9vciBjYW1lcmEKPiDC
oCogY29uZmlndXJhdGlvbiBhZnRlciB0aGUgc3RyZWFtaW5nIGhhcyBzdGFydGVkLgo+IMKgKgo+
IMKgKiBJZiBudW1fYnVmcyBpcyAwIGFuZCBzdHJlYW1pbmcgaGFzIG5vdCBzdGFydGVkIHlldCwg
dGhlbiB0aGUgYmFja2VuZCBtYXkKPiDCoCogZnJlZSBhbGwgcHJldmlvdXNseSBhbGxvY2F0ZWQg
YnVmZmVycyAoaWYgYW55KSBvciBkbyBub3RoaW5nLgoKSSB3b3VsZCByZXBocmFzZSB0aGlzOgoK
KiBJZiBudW1fYnVmcyBpcyAwIGFuZCBzdHJlYW1pbmcgaGFzIG5vdCBzdGFydGVkIHlldCwgdGhl
biB0aGUgYmFja2VuZCB3aWxsCiogZnJlZSBhbGwgcHJldmlvdXNseSBhbGxvY2F0ZWQgYnVmZmVy
cyAoaWYgYW55KS4KClRoZSBwcmV2aW91cyB0ZXh0IHN1Z2dlc3RlZCB0aGF0IHRoZSBiYWNrZW5k
IG1pZ2h0IGNob29zZSBub3QgdG8gZnJlZQp0aGUgYWxsb2NhdGVkIGJ1ZmZlcnMsIGJ1dCB0aGF0
J3Mgbm90IHRoZSBjYXNlLgoKPiDCoCogVHJ5aW5nIHRvIGNhbGwgdGhpcyBpZiBzdHJlYW1pbmcg
aXMgaW4gcHJvZ3Jlc3Mgd2lsbCByZXN1bHQgaW4gYW4gZXJyb3IuCj4gwqAqCj4gwqAqIElmIGNh
bWVyYSByZWNvbmZpZ3VyYXRpb24gaXMgcmVxdWlyZWQgdGhlbiB0aGUgc3RyZWFtaW5nIG11c3Qg
YmUgc3RvcHBlZAo+IMKgKiBhbmQgdGhpcyByZXF1ZXN0IG11c3QgYmUgc2VudCB3aXRoIG51bV9i
dWZzIHNldCB0byB6ZXJvIGFuZCBmaW5hbGx5Cj4gwqAqIGJ1ZmZlcnMgZGVzdHJveWVkLgo+IMKg
Kgo+IMKgKiBQbGVhc2Ugbm90ZSwgdGhhdCB0aGUgbnVtYmVyIG9mIGJ1ZmZlcnMgaW4gdGhpcyBy
ZXF1ZXN0IG11c3Qgbm90IGV4Y2VlZAo+IMKgKiB0aGUgdmFsdWUgY29uZmlndXJlZCBpbiBYZW5T
dG9yZS5tYXgtYnVmZmVycy4KPiDCoCoKPiDCoCogU2VlIHJlc3BvbnNlIGZvcm1hdCBmb3IgdGhp
cyByZXF1ZXN0LgoKV2l0aCB0aGF0IHNtYWxsIGNoYW5nZSB0aGUgdGV4dCBsb29rcyBnb29kIHRv
IG1lLgoKUmVnYXJkcywKCglIYW5zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
