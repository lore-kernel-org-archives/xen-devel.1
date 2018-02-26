From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 0/5] x86: Multiple fixes to MSR_TSC_AUX
 and RDTSCP handling for guests
Date: Mon, 26 Feb 2018 23:30:02 +0000
Message-ID: <bd5b1055-78eb-ef1a-1c99-621ee8ed5bc2@citrix.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <3932aaca-1d30-85f9-b27a-c717997794fa@citrix.com>
 <fa752277-f9d1-610c-dbdf-4d9d1ab6a96a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <fa752277-f9d1-610c-dbdf-4d9d1ab6a96a@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMjAxOCAxOTo0NCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAyLzI2LzIw
MTggMDI6MTIgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDIwLzAyLzE4IDExOjU4LCBB
bmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gVGhpcyByYXRzIG5lc3Qgd2FzIGRpc2NvdmVyZWQgd2hl
biBmaW5kaW5nIHRoYXQgTVNSX1RTQ19BVVggbGVha2VkIGludG8gUFYKPj4+IGd1ZXN0cy4gIEl0
IGlzIFJGQyBiZWNhdXNlIEkgaGF2ZW4ndCBkb25lIGV4dGVuc2l2ZSB0ZXN0aW5nIG9uIHRoZSBy
ZXN1bHQsIGFuZAo+Pj4gYmVjYXVzZSB0aGVyZSBhcmUgc29tZSBmdW5jdGlvbmFsIGNoYW5nZXMg
Zm9yIHRoZSB2aXJ0dWFsaXNlZCBUU0MgbW9kZXMuCj4+Pgo+Pj4gQW5kcmV3IENvb3BlciAoNSk6
Cj4+PiAgIHg4Ni9odm06IERvbid0IHNoYWRvdyB0aGUgZG9tYWluIHBhcmFtZXRlciBpbiBodm1f
c2F2ZV9jcHVfbXNycygpCj4+PiAgIHg4Ni9wdjogQXZvaWQgbGVha2luZyBvdGhlciBndWVzdHMn
IE1TUl9UU0NfQVVYIHZhbHVlcyBpbnRvIFBWIGNvbnRleHQKPj4+ICAgeDg2L3RpbWU6IFJld29y
ayBwdl9zb2Z0X3JkdHNjKCkgdG8gYWlkIGZ1cnRoZXIgY2xlYW51cAo+Pj4gICB4ODYvcHY6IFJl
bW92ZSBkZWZlcnJlZCBSRFRTQ3ssUH0gaGFuZGxpbmcgaW4gcHZfZW11bGF0ZV9wcml2aWxlZ2Vk
X29wKCkKPj4+ICAgeDg2OiBSZXdvcmsgTVNSX1RTQ19BVVggaGFuZGxpbmcgZnJvbSBzY3JhdGNo
Lgo+PiBLb25yYWQvQm9yaXM6IENhbiB3ZSBoYXZlIGFueSBpbnB1dCBXUlQgVFNDX01PREVfUFZS
RFRTQ1AgdXNhZ2U/ICBBcmUKPj4geW91IHN0aWxsIHVzaW5nIHRoZSBmZWF0dXJlLCBvciBpcyBp
dCBhYmFuZG9uZWQ/Cj4gSSBhbHJlYWR5IGFza2VkIGEgZmV3IGludGVybmFsIHRlYW1zIGFib3V0
LCBoYXZlbid0IGhlYXJkIGJhY2suCgpBaCBvayAtIHRoYW5rcy7CoCBJJ2xsIHdhaXQgdG8gaGVh
ciBiYWNrIGZyb20geW91IHRoZW4uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
