From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V5 1/3] x86/altp2m: propagate ept.ad changes
 to all active altp2ms
Date: Wed, 14 Nov 2018 05:44:46 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE49E19@SHSMSX101.ccr.corp.intel.com>
References: <1541945224-23075-1-git-send-email-rcojocaru@bitdefender.com>
 <1541945224-23075-2-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=djhp=nz=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gMnyu-0006Fu-QZ
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 05:44:52 +0000
In-Reply-To: <1541945224-23075-2-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSYXp2YW4gQ29qb2NhcnUgW21haWx0bzpyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
XQo+IFNlbnQ6IFN1bmRheSwgTm92ZW1iZXIgMTEsIDIwMTggMTA6MDcgUE0KPiAKPiBUaGlzIHBh
dGNoIGlzIGEgcHJlLXJlcXVpc2l0ZSBmb3IgZml4aW5nIHRoZSBsb2dkaXJ0eSBWR0EgaXNzdWUK
PiAoZGlzcGxheSBmcmVlemVzIHdoZW4gc3dpdGNoaW5nIHRvIGEgbmV3IGFsdHAybSB2aWV3IGVh
cmx5IGluIGEKPiBkb21haW4ncyBsaWZldGltZSksIGJ1dCBzZW50IHNlcGFyYXRlbHkgZm9yIGVh
c2llciByZXZpZXcuCgppdCdzIGluIHRoZSBzZXJpZXMgbm93LCBpbnN0ZWFkIG9mIHNlbmRpbmcg
c2VwYXJhdGVseS4KCj4gVGhlIG5ldyBlcHRfc2V0X2FkX3N5bmMoKSBmdW5jdGlvbiBoYXMgYmVl
biBhZGRlZCB0byB1cGRhdGUgYWxsCj4gYWN0aXZlIGFsdHAybXMnIGVwdC5hZC4gTmV3IGFsdHAy
bXMgd2lsbCBpbmhlcml0IHRoZSBob3N0cDJtJ3MKPiBlcHQuYWQgdmFsdWUuCj4gCj4gVGhlIHAy
bV97ZW4sZGlzfWFibGVfaGFyZHdhcmVfbG9nX2RpcnR5KCkgaG9zdHAybSBsb2NraW5nIGhhcwo+
IGJlZW4gbW92ZWQgdG8gdGhlIG5ldyBlcHRfe2VuLGRpc31hYmxlX2hhcmR3YXJlX2xvZ19kaXJ0
eSgpCj4gZnVuY3Rpb25zIGFzIHBhcnQgb2YgdGhlIGNvZGUgcmVmYWN0b3JpbmcsIHdoaWxlIGxv
Y2tzIGZvciB0aGUKPiBpbmRpdmlkdWFsIGFsdHAybXMgYXJlIHRha2VuIGluIGVwdF9zZXRfYWRf
c3luYygpIChjYWxsZWQgYnkKPiBlcHRfe2VuLGRpc31hYmxlX3BtbCgpKS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4gU3Vn
Z2VzdGVkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gVGVz
dGVkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gQWNrZWQtYnk6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
