From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/mm: Suppresses vm_events caused by
	page-walks
Date: Fri, 23 Feb 2018 17:46:58 +0000
Message-ID: <20180223174658.vmb2uajv5epf6tn2@citrix.com>
References: <1515415784-28744-1-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1515415784-28744-1-git-send-email-aisaila@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Isaila <aisaila@bitdefender.com>
Cc: tim@xen.org, sstabellini@kernel.org, wei.liu2@citrix.com, rcojocaru@bitdefender.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, tamas@tklengyel.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMDgsIDIwMTggYXQgMDI6NDk6NDRQTSArMDIwMCwgQWxleGFuZHJ1IElzYWls
YSB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGFkZGluZyBhIHdheSB0byBlbmFibGUvZGlzYWJsZSBu
ZXN0ZWQgcGFnZWZhdWx0Cj4gZXZlbnRzLiBJdCBpbnRyb2R1Y2VzIHRoZSB4Y19tb25pdG9yX25l
c3RlZF9wYWdlZmF1bHQgZnVuY3Rpb24KPiBhbmQgYWRkcyB0aGUgbmVzdGVkX3BhZ2VmYXVsdF9k
aXNhYmxlZCBpbiB0aGUgbW9uaXRvciBzdHJ1Y3R1cmUuCj4gVGhpcyBpcyBuZWVkZWQgYnkgdGhl
IGludHJvc3BlY3Rpb24gc28gaXQgd2lsbCBvbmx5IGdldCBnbGEKPiBmYXVsdHMgYW5kIG5vdCBn
ZXQgc3BhbW1lZCB3aXRoIG90aGVyIGZhdWx0cy4KPiBJbiBwMm1fc2V0X2FkX2JpdHMgdGhlIHYt
PmFyY2guc3NlX3BnX2RpcnR5LmVpcCBhbmQKPiB2LT5hcmNoLnNzZV9wZ19kaXJ0eS5nbGEgYXJl
IHVzZWQgdG8gbWFyayB0aGF0IHRoaXMgaXMgdGhlCj4gc2Vjb25kIHRpbWUgYSBmYXVsdCBvY2N1
cnMgYW5kIHRoZSBkaXJ0eSBiaXQgaXMgc2V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
dSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+IAo+IC0tLQo+IENoYW5nZXMgc2lu
Y2UgVjE6Cj4gICAgICAgICAtIFJiIFYxCj4gCS0gQWRkIGNvbW1lbnQgaW4gZG9tY3RsLmgKPiAt
LS0KPiAgdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggfCAgMiArKwo+ICB0b29scy9saWJ4
Yy94Y19tb25pdG9yLmMgICAgICB8IDE0ICsrKysrKysrKysrKysrCgpUaGVzZSBjaGFuZ2VzIGxv
b2sgc2Vuc2libGUgdG8gbWUuCgo+ICB4ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jICB8IDI3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICB4ZW4vYXJjaC94ODYvbW9uaXRvci5jICAg
ICAgICB8IDEzICsrKysrKysrKysrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCAg
fCAgNiArKysrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9tb25pdG9yLmggfCAgMyArKy0KPiAg
eGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oICAgfCAgMiArKwoKWW91IG1pZ2h0IHdhbnQgdG8g
YnVtcCBkb21jdGwgdmVyc2lvbiBudW1iZXIgaXQgaXMgaGFzIGJlZW4gZG9uZSBhbHJlYWR5Cmlu
IHRoaXMgcmVsZWFzZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
