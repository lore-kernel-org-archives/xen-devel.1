From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V4 1/3] x86/altp2m: propagate ept.ad changes
 to all active altp2ms
Date: Thu, 8 Nov 2018 19:08:20 +0200
Message-ID: <e09dabff-3c8e-f4e1-06cd-688243cd6909@bitdefender.com>
References: <1541083542-22464-1-git-send-email-rcojocaru@bitdefender.com>
 <1541083542-22464-2-git-send-email-rcojocaru@bitdefender.com>
 <595aca62-5db8-5975-1a3d-75fcc88daeb3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6g0g=nt=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gKnn9-0000dV-DK
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:08:27 +0000
In-Reply-To: <595aca62-5db8-5975-1a3d-75fcc88daeb3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvOC8xOCA2OjU2IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDExLzAxLzIwMTgg
MDI6NDUgUE0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gVGhpcyBwYXRjaCBpcyBhIHByZS1y
ZXF1aXNpdGUgZm9yIGZpeGluZyB0aGUgbG9nZGlydHkgVkdBIGlzc3VlCj4+IChkaXNwbGF5IGZy
ZWV6ZXMgd2hlbiBzd2l0Y2hpbmcgdG8gYSBuZXcgYWx0cDJtIHZpZXcgZWFybHkgaW4gYQo+PiBk
b21haW4ncyBsaWZldGltZSksIGJ1dCBzZW50IHNlcGFyYXRlbHkgZm9yIGVhc2llciByZXZpZXcu
Cj4+IFRoZSBuZXcgZXB0X3NldF9hZF9zeW5jKCkgZnVuY3Rpb24gaGFzIGJlZW4gYWRkZWQgdG8g
dXBkYXRlIGFsbAo+PiBhY3RpdmUgYWx0cDJtcycgZXB0LmFkLiBOZXcgYWx0cDJtcyB3aWxsIGlu
aGVyaXQgdGhlIGhvc3RwMm0ncwo+PiBlcHQuYWQgdmFsdWUuCj4+Cj4+IFRoZSBwMm1fe2VuLGRp
c31hYmxlX2hhcmR3YXJlX2xvZ19kaXJ0eSgpIGhvc3RwMm0gbG9ja2luZyBoYXMKPj4gYmVlbiBt
b3ZlZCB0byB0aGUgbmV3IGVwdF97ZW4sZGlzfWFibGVfaGFyZHdhcmVfbG9nX2RpcnR5KCkKPj4g
ZnVuY3Rpb25zIGFzIHBhcnQgb2YgdGhlIGNvZGUgcmVmYWN0b3JpbmcsIHdoaWxlIGxvY2tzIGZv
ciB0aGUKPj4gaW5kaXZpZHVhbCBhbHRwMm1zIGFyZSB0YWtlbiBpbiBlcHRfc2V0X2FkX3N5bmMo
KSAoY2FsbGVkIGJ5Cj4+IGVwdF97ZW4sZGlzfWFibGVfcG1sKCkpLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4+IFN1Z2dl
c3RlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+PiBUZXN0
ZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiAKPiBTb3JyeSBm
b3IgdGhlIGRlbGF5Ogo+IAo+IEFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+CgpUaGFua3MhCgoKTXVjaCBhcHByZWNpYXRlZCwKUmF6dmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
