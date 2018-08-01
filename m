From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/vmx: Avoid hitting BUG_ON() after
 EPTP-related domain_crash()
Date: Wed, 1 Aug 2018 15:12:10 +0300
Message-ID: <83605e6a-13af-fc2e-deed-6f6d87d2d0e0@bitdefender.com>
References: <1533125256-4141-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533125256-4141-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDEvMjAxOCAwMzowNyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJZiB0aGUgRVBU
UCBwb2ludGVyIGNhbid0IGJlIGxvY2F0ZWQgaW4gdGhlIGFsdHAybSBsaXN0LCB0aGUgZG9tYWlu
Cj4gaXMgKGxlZ2l0aW1hdGVseSkgY3Jhc2hlZC4KPiAKPiBVbmRlciB0aG9zZSBjaXJjdW1zdGFu
Y2VzLCBleGVjdXRpb24gd2lsbCBjb250aW51ZSBhbmQgZ3VhcmVudGVlIHRvIGhpdCB0aGUKPiBC
VUdfT04oaWR4ID49IE1BWF9BTFRQMk0pICh1bmZvcnR1bmF0ZWx5LCBqdXN0IG91dCBvZiBjb250
ZXh0KS4KPiAKPiBSZXR1cm4gZnJvbSB2bXhfdm1leGl0X2hhbmRsZXIoKSBhZnRlciB0aGUgZG9t
YWluX2NyYXNoKCksIHdoaWNoIGFsc28gaGFzIHRoZQo+IHNpZGUgZWZmZWN0IG9mIHJlZW50ZXJp
bmcgdGhlIHNjaGVkdWxlciBtb3JlIHByb21wdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUmF6dmFu
IENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKClRoYW5rcywKUmF6dmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
