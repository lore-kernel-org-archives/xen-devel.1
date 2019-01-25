From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/sched: Introduce domain_vcpu() helper
Date: Fri, 25 Jan 2019 11:30:59 +0000
Message-ID: <7c91aadf-6107-dbf4-be60-0def6bb7493d@arm.com>
References: <1548255569-23334-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548255569-23334-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMy8wMS8yMDE5IDE0OjU5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ICsvKgo+ICsg
KiBGb3IgZWFjaCBhbGxvY2F0ZWQgdmNwdSwgZC0+dmNwdVtYXS0+dmNwdV9pZCA9PSBYCj4gKyAq
Cj4gKyAqIER1cmluZyBjb25zdHJ1Y3Rpb24sIGFsbCB2Y3B1cyBpbiBkLT52Y3B1W10gYXJlIGFs
bG9jYXRlZCBzZXF1ZW50aWFsbHksIGFuZAo+ICsgKiBpbiBhc2NlbmRpbmcgb3JkZXIuICBUaGVy
ZWZvcmUsIGlmIGQtPnZjcHVbTl0gZXhpc3RzIChlLmcuIGRlcml2ZWQgZnJvbQo+ICsgKiBjdXJy
ZW50KSwgYWxsIHZjcHVzIHdpdGggYW4gaWQgbGVzcyB0aGFuIE4gYWxzbyBleGlzdC4KPiArICoK
PiArICogU01QIGNvbnNpZGVyYXRpb25zOiBUaGUgaWRsZSBkb21haW4gaXMgY29uc3RydWN0ZWQg
YmVmb3JlIEFQcyBhcmUgc3RhcnRlZC4KPiArICogQWxsIG90aGVyIGRvbWFpbnMgaGF2ZSBkLT52
Y3B1W10gYWxsb2NhdGVkIGFuZCBkLT5tYXhfdmNwdXMgc2V0IGJlZm9yZSB0aGUKPiArICogZG9t
YWluIGlzIG1hZGUgdmlzaWJsZSBpbiB0aGUgZG9tbGlzdCwgd2hpY2ggaXMgc2VyaWFsaXNlZCBv
biB0aGUgZ2xvYmFsCj4gKyAqIGRvbWxpc3RfdXBkYXRlX2xvY2suCj4gKyAqCj4gKyAqIFRoZXJl
Zm9yZSwgYWxsIG9ic2VydmF0aW9ucyBvZiBkLT5tYXhfdmNwdXMgdnMgZC0+dmNwdVtdIHdpbGwg
YmUgY29uc2lzdGVudAo+ICsgKiBkZXNwaXRlIHRoZSBsYWNrIG9mIHNtcF8qIGJhcnJpZXJzLCBl
aXRoZXIgYnkgYmVpbmcgb24gdGhlIHNhbWUgQ1BVIGFzIHRoZQo+ICsgKiBvbmUgd2hpY2ggaXNz
dWVkIHRoZSB3cml0ZXMsIG9yIGJlY2F1c2Ugb2YgYmFycmllciBwcm9wZXJ0aWVzIG9mIHRoZSBk
b21haW4KPiArICogaGF2aW5nIGJlZW4gaW5zZXJ0ZWQgaW50byB0aGUgZG9tbGlzdC4KPiArICov
CgogRnJvbSBhbiBBcm0gcGVyc3BlY3RpdmUsIHRoaXMgbWFrZXMgc2Vuc2UgdG8gbWUuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
