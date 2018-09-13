From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/3] x86/viridan: Clean up Viridian MSR
 infrastructure
Date: Thu, 13 Sep 2018 06:28:18 -0600
Message-ID: <5B9A57E202000078001E8329@prv1-mh.provo.novell.com>
References: <1536692177-15675-1-git-send-email-andrew.cooper3@citrix.com>
 <1536692177-15675-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536692177-15675-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDIwOjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gUmVuYW1lIHRoZSBmdW5jdGlvbnMgdG8gZ3Vlc3Rfe3JkLHdyfW1zcl92aXJpZGlhbigp
IGZvciBjb25zaXN0ZW5jeSwgYW5kCj4gYmVjYXVzZSB0aGUgX3JlZ3MoKSBzdWZmaXggaXNuJ3Qg
dmVyeSBhcHByb3ByaWF0ZS4KPiAKPiBVcGRhdGUgdGhlbSB0byB0YWtlIGEgdmNwdSBwb2ludGVy
IHJhdGhlciB0aGFuIHByZXN1bWluZyB0aGF0IHRoZXkgYWN0IG9uCj4gY3VycmVudCwgd2hpY2gg
aXMgc2FmZSBmb3IgYWxsIGltcGxlbWVudGVkIG9wZXJhdGlvbnMsIGFuZCBzd2l0Y2ggdGhlaXIg
cmV0dXJuCj4gQUJJIHRvIHVzZSBYODZFTVVMXyouCj4gCj4gVGhlIGRlZmF1bHQgY2FzZXMgbm8g
bG9uZ2VyIG5lZWQgdG8gZGVhbCB3aXRoIE1TUnMgb3V0IG9mIHRoZSBWaXJpZGlhbiByYW5nZSwK
PiBidXQgZHJvcCB0aGUgcHJpbnRrcyB0byBkZWJ1ZyBidWlsZHMgb25seSBhbmQgaWRlbnRpZnkg
dGhlIHZhbHVlIGF0dGVtcHRpbmcgdG8KPiBiZSB3cml0dGVuLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
