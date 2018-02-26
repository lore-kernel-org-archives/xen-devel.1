From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 0/5] x86: Multiple fixes to MSR_TSC_AUX
 and RDTSCP handling for guests
Date: Mon, 26 Feb 2018 19:12:19 +0000
Message-ID: <3932aaca-1d30-85f9-b27a-c717997794fa@citrix.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDIvMTggMTE6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhpcyByYXRzIG5lc3Qg
d2FzIGRpc2NvdmVyZWQgd2hlbiBmaW5kaW5nIHRoYXQgTVNSX1RTQ19BVVggbGVha2VkIGludG8g
UFYKPiBndWVzdHMuICBJdCBpcyBSRkMgYmVjYXVzZSBJIGhhdmVuJ3QgZG9uZSBleHRlbnNpdmUg
dGVzdGluZyBvbiB0aGUgcmVzdWx0LCBhbmQKPiBiZWNhdXNlIHRoZXJlIGFyZSBzb21lIGZ1bmN0
aW9uYWwgY2hhbmdlcyBmb3IgdGhlIHZpcnR1YWxpc2VkIFRTQyBtb2Rlcy4KPgo+IEFuZHJldyBD
b29wZXIgKDUpOgo+ICAgeDg2L2h2bTogRG9uJ3Qgc2hhZG93IHRoZSBkb21haW4gcGFyYW1ldGVy
IGluIGh2bV9zYXZlX2NwdV9tc3JzKCkKPiAgIHg4Ni9wdjogQXZvaWQgbGVha2luZyBvdGhlciBn
dWVzdHMnIE1TUl9UU0NfQVVYIHZhbHVlcyBpbnRvIFBWIGNvbnRleHQKPiAgIHg4Ni90aW1lOiBS
ZXdvcmsgcHZfc29mdF9yZHRzYygpIHRvIGFpZCBmdXJ0aGVyIGNsZWFudXAKPiAgIHg4Ni9wdjog
UmVtb3ZlIGRlZmVycmVkIFJEVFNDeyxQfSBoYW5kbGluZyBpbiBwdl9lbXVsYXRlX3ByaXZpbGVn
ZWRfb3AoKQo+ICAgeDg2OiBSZXdvcmsgTVNSX1RTQ19BVVggaGFuZGxpbmcgZnJvbSBzY3JhdGNo
LgoKS29ucmFkL0JvcmlzOiBDYW4gd2UgaGF2ZSBhbnkgaW5wdXQgV1JUIFRTQ19NT0RFX1BWUkRU
U0NQIHVzYWdlP8KgIEFyZQp5b3Ugc3RpbGwgdXNpbmcgdGhlIGZlYXR1cmUsIG9yIGlzIGl0IGFi
YW5kb25lZD8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
