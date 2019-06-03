From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
Date: Mon, 3 Jun 2019 15:47:26 +0100
Message-ID: <23797.13054.100903.540173@mariner.uk.xensource.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-10-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oBRP=UC=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hXoFm-0001Pj-7M
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:48:02 +0000
In-Reply-To: <20190521212530.12706-10-volodymyr_babchuk@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Vm9sb2R5bXlyIEJhYmNodWsgd3JpdGVzICgiW1hlbi1kZXZlbF0gW1BBVENIIHY1IDA5LzEwXSB0
b29scy9hcm06IHRlZTogYWRkICJ0ZWUiIG9wdGlvbiBmb3IgeGwuY2ZnIik6Cj4gVGhpcyBlbnVt
ZXJhdGlvbiBjb250cm9scyBURUUgdHlwZSBmb3IgYSBkb21haW4uIEN1cnJlbnRseSB0aGVyZSBp
cwo+IHR3byBwb3NzaWJsZSBvcHRpb25zOiBlaXRoZXIgJ25vbmUnIG9yICdvcHRlZScuCj4gCj4g
J25vbmUnIGlzIHRoZSBkZWZhdWx0IHZhbHVlIGFuZCBpdCBiYXNpY2FsbHkgZGlzYWJsZXMgVEVF
IHN1cHBvcnQgYXQKPiBhbGwuCj4gCj4gJ25hdGl2ZScgZW5hYmxlcyBhY2Nlc3MgdG8gYSAicmVh
bCIgT1AtVEVFIGluc3RhbGxlZCBvbiBhIHBsYXRmb3JtLgo+IAo+IEl0IGlzIHBvc3NpYmxlIHRv
IGFkZCBhbm90aGVyIHR5cGVzIGluIHRoZSBmdXR1cmUuCgpDb3VsZCBpbXByb3ZlIHRoaXMgYml0
IG1heWJlID8KCj4gKz1pdGVtIEI8Im9wdGVlIj4KPiArCj4gK0FsbG93IGd1ZXN0IHRvIGFjY2Vz
cyB0byBPUC1URUUgZW5hYmxlZCBvbiB0aGUgcGxhdGZvcm0uIEd1ZXN0IHdpbGwgbm90IGJlIGNy
ZWF0ZWQKPiAraWYgcGxhdGZvcm0gZG9lcyBub3QgaGF2ZSBPUC1URUUgd2l0aCB2aXJ0dWFsaXph
dGlvbiBmZWF0dXJlIG9yIGlmIE9QLVRFRSB3aWxsCj4gK2RlbnkgYWNjZXNzLgoKVG8gbWUgKHdo
byBkb2Vzbid0IHJlYWxseSB1bmRlcnN0YW5kIHRoaXMgc3R1ZmYgdmVyeSB3ZWxsKSB0aGlzCmRv
ZXNuJ3QgYW5zd2VyIGEgdmVyeSBpbXBvcnRhbnQgcXVlc3Rpb246IGlmIEkgZW5hYmxlIHRoaXMs
IHdoYXQgKGlmCmFueSkgaG9zdC9tYWNoaW5lLyZjIHJlc291cmNlcyB3aWxsIHRoaXMgZ3JhbnQg
dGhlIGd1ZXN0IGFjY2VzcyB0byA/CgpJdCBzb3VuZHMgbGlrZSB0aGUgdGhlIGFuc3dlciBzaG91
bGQgYmUgIm5vbmUiLCBiZWNhdXNlIGlmIEkgc2VhcmNoCmZvciAib3AtdGVlIiBvbmxpbmUgSSB3
b3VsZCBnZXQgdGhlIGltcHJlc3Npb24gdGhhdCBpdCBpcyBhbgplbXVsYXRvci4gIE5vcm1hbGx5
IGdyYW50aW5nIGFjY2VzcyB0byBhbiBlbXVsYXRvciBkb2VzIG5vdCBncmFudAphY2Nlc3MgdG8g
aG9zdCByZXNvdXJjZXMuCgpCdXQgaW4gdGhpcyBzZXJpZXMgeW91IHRhbGsgYWJvdXQgaXQgYmVp
bmcgYSBtZWRpYXRvciBzbyBJIHN1c3BlY3QKdGhhdCBpcyBub3QgcmlnaHQuCgpJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
