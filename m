From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/5] x86/hvm: Adjust hvmemul_rep_stos() to
 compile with -Wvla
Date: Mon, 24 Sep 2018 08:16:17 -0600
Message-ID: <5BA8F1B102000078001EB3B3@prv1-mh.provo.novell.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
 <1537794003-30851-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1537794003-30851-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA5LjE4IGF0IDE1OjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRm9yIGF0IGxlYXN0ICJnY2MgKFVidW50dSA1LjQuMC02dWJ1bnR1MX4xNi4wNC4xMCkg
NS40LjAgMjAxNjA2MDkiLCB0aGUKPiB0eXBlY2FzdCBvZiBidWYgdHJpZ2dlcnMgYSBWYXJpYWJs
ZSBMZW5ndGggQXJyYXkgd2FybmluZy4KPiAKPiBBbHRlciB0aGUgYXNtIGV4cHJlc3Npb24gdG8g
YXZvaWQgdGhlIHR5cGVjYXN0LCB3aGljaCBuZWNlc3NpdGF0ZXMgdGhlCj4gaW50cm9kdWN0aW9u
IG9mIGEgbWVtb3J5IGNsb2JiZXIgYXMgdGhlIGNvbXBpbGVyIGNhbiBubyBsb25nZXIgaWRlbnRp
ZnkKPiB0aGUgdG90YWwgcXVhbnRpdHkgb2Ygd3JpdHRlbiBtZW1vcnkuCgpJIGRpc2xpa2UgdGhp
cywgYnV0IHdoYXQgZG8geW91IGRvLiBXb3VsZCBiZSBxdWl0ZSBoZWxwZnVsIHRob3VnaCB0bwpo
YXZlIGEgY29tbWVudCB0aGVyZSwgb3IgZWxzZSBJIG1pZ2h0IGJlIHRlbXB0ZWQgdG8gdW5kbyB0
aGUKbWVtb3J5IGNsb2JiZXIgaW4gYSBjb3VwbGUgb2YgbW9udGhzL3llYXJzIHRpbWUuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
