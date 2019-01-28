From: Julien Grall <julien.grall@arm.com>
Subject: Re: Backport candidate for Arm
Date: Mon, 28 Jan 2019 10:50:57 +0000
Message-ID: <bc7a2f15-87c2-659a-a0ab-1ac40ef35992@arm.com>
References: <80edd4d5-e2b7-bcb5-32ac-9d2c9096299f@arm.com>
 <cc1466b5-fbc3-0e1f-6092-4f559866337c@arm.com>
 <alpine.DEB.2.10.1901251719390.17936@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CKwR=QE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1go4VK-0005XQ-0d
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 10:51:02 +0000
In-Reply-To: <alpine.DEB.2.10.1901251719390.17936@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxLzI2LzE5IDE6MzAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBN
b24sIDIxIEphbiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBQaW5nPwo+
Pgo+PiBDaGVlcnMsCj4+Cj4+IE9uIDMwLzExLzIwMTggMTc6MjUsIEp1bGllbiBHcmFsbCB3cm90
ZToKPj4+IEhpLAo+Pj4KPj4+IEJlbG93IGEgbGlzdCBvZiBiYWNrcG9ydCBjYW5kaWRhdGUgZm9y
IEFybS4KPj4+Cj4+Pgo+Pj4gRm9yIFhlbiA0LjEwKyB0byBoYW5kbGUgY29ycmVjdGx5IFNNQyBj
YWxsIHBhcmFtZXRlcnMgYW5kIHJlc3VsdAo+Pj4KPj4+IDM1ZmM2MDg2MTLCoMKgwqAgeGVuL2Fy
bTogc21jY2MtMS4xOiBNYWtlIHJldHVybiB2YWx1ZXMgdW5zaWduZWQgbG9uZwo+Pj4gZmE3OTc0
Zjc0M8KgwqDCoMKgwqAgeGVuL2FybTogc21jY2MtMS4xOiBIYW5kbGUgZnVuY3Rpb24gcmVzdWx0
IGFzIHBhcmFtZXRlcnMKPj4+Cj4+PiBGb3IgWGVuIDQuOSsgdG8gYXZvaWQgRG9tMCBjcmFzaCB3
aGVuIHVzaW5nIGxlc3MgdkNQVXMgdGhhbiBwQ1BVcyBvbiBHSUN2Mwo+Pj4KPj4+IDcwM2Q5ZDVl
YzHCoMKgwqDCoMKgIHhlbi9hcm06IHZnaWMtdjM6IERlbGF5IHRoZSBpbml0aWFsaXphdGlvbiBv
ZiB0aGUgZG9tYWluCj4+PiBpbmZvcm1hdGlvbgo+Pj4gNTRlYzU5ZjZiMMKgwqDCoMKgwqDCoCB4
ZW4vYXJtOiB2Z2ljLXYzOiBEb24ndCBjcmVhdGUgZW1wdHkgcmUtZGlzdHJpYnV0b3IgcmVnaW9u
cwo+Pj4KPj4+IFRoZSBmb2xsb3dpbmcgcGF0Y2ggaXMgcmVxdWlyZWQgaW4gWGVuIDQuMTEgdG8g
YXZvaWQgYnJlYWtpbmcgdGhlIG5ldyB2R0lDCj4+PiBhZnRlciBhcHBseWluZyB0aGUgMiBwcmV2
aW91cyBwYXRjaGVzLgo+Pj4KPj4+IDYyYWE5ZTdmMWLCoMKgwqAgeGVuL2FybTogRG9uJ3QgYnVp
bGQgR0lDdjMgd2l0aCB0aGUgbmV3IHZHSUMKPiAKPiBGb3IgdGhlIG1vbWVudCBJIHNraXBwZWQg
NTRlYzU5ZjZiMCBhbmQgNjJhYTllN2YxYiBiZWNhdXNlIDYyYWE5ZTdmMWIgaXMKPiBub3QgYSB0
cml2aWFsIGJhY2twb3J0LiBFdmVyeXRoaW5nIGVsc2UgaXMgZG9uZS4KClRoYW5rIHlvdSBmb3Ig
YmFja3BvcnRpbmcgdGhlIHBhdGNoZXMuIEkgdGhpbmsgaXQgd2FzIGEgYml0IG9kZCB0byBhcHBs
eSAKcGF0Y2ggNzAzZDlkNWVjMSB3aXRob3V0IHRoZSAyIHBhdGNoZXMuIEFueXdheSwgYmVsb3cg
YSByZXBsYWNlbWVudCAKcGF0Y2ggZm9yIDYyYWE5ZTdmMWIuCgpkaWZmIC0tY2MgeGVuL2FyY2gv
YXJtL0tjb25maWcKaW5kZXggODE3NGMwYzYzNSw1ODFkZTY3YjZiLi4wMDAwMDAwMDAwCi0tLSBh
L3hlbi9hcmNoL2FybS9LY29uZmlnCisrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCkBAQCAtMTIs
NyAtMTIsNiArMTIsNyBAQEAgY29uZmlnIEFSTV8zCiAgIGNvbmZpZyBBUk1fNjQKICAgICAgICAg
ZGVmX2Jvb2wgeQogICAgICAgICBkZXBlbmRzIG9uIDY0QklUCi0gICAgICAgc2VsZWN0IEhBU19H
SUNWMworKyAgICAgIHNlbGVjdCBIQVNfR0lDVjMgaWYgIU5FV19WR0lDCgogICBjb25maWcgQVJN
CiAgICAgICAgIGRlZl9ib29sIHkKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
