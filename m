From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86: Switch "struct desc_struct" to
 being seg_desc_t
Date: Fri, 07 Dec 2018 05:00:58 -0700
Message-ID: <5C0A60FA0200007800204093@prv1-mh.provo.novell.com>
References: <1544119435-15037-1-git-send-email-andrew.cooper3@citrix.com>
 <1544119435-15037-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1544119435-15037-2-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjEyLjE4IGF0IDE5OjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIHN0cnVjdCBzdWZmaXggaXMgcmVkdW5kYW50IGluIHRoZSBuYW1lLCBhbmQgYSBm
dXR1cmUgY2hhbmdlIHdpbGwgd2FudCB0bwo+IHR1cm4gaXQgaW50byBhIHVuaW9uLCByYXRoZXIg
dGhhbiBhIHN0cnVjdHVyZS4gIEFzIHRoaXMgcmVwcmVzZW50cyBhIHNlZ21lbnQKPiBkZXNjcmlw
dG9yLCBnaXZlIGl0IGFuIGFwcHJvcHJpYXRlIHR5cGVkZWYuCj4gCj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgpi
dXQgd2l0aCBhIChtb3JlIGdlbmVyYWwpIHF1ZXN0aW9uOiBBcmUgd2UgdGhlbiBvdXJzZWx2ZXMg
b24gYQpwb3NpdGlvbiBkaWZmZXJlbnQgdGhhbiBzb21lIExpbnV4IG1haW50YWluZXJzIGhhdmUg
dGFrZW4gaW4gdGhlCnBhc3QsIGRlY2xhcmluZyB0aGF0IHR5cGVkZWYtcyBhcmUgZXZpbD8gSSd2
ZSBuZXZlciB1bmRlcnN0b29kCndoYXQgcmVhc29uKHMpIHRoZXkgaGFkLCBzbyBwbGVhc2UgZG9u
J3QgdGFrZSB0aGlzIGFzIGFuIG9iamVjdGlvbgppbiBhbnkgd2F5LgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
