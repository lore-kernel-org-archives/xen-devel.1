From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] x86/vmx: Simplify PAT handling during
 vcpu construction
Date: Tue, 29 May 2018 05:41:49 -0600
Message-ID: <5B0D3C7D02000078001C68EF@prv1-mh.provo.novell.com>
References: <1527517678-1779-1-git-send-email-andrew.cooper3@citrix.com>
 <1527517678-1779-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527517678-1779-5-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA1LjE4IGF0IDE2OjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIGhvc3QgUEFUIHZhbHVlIGlzIGEgY29tcGlsZSB0aW1lIGNvbnN0YW50LCBhbmQg
ZG9lc24ndCBuZWVkIHRvIGJlIHJlYWQgb3V0Cj4gb2YgaGFyZHdhcmUuICBNZXJnZSB0aGlzIGlm
IGJsb2NrIGludG8gdGhlIHByZXZpb3VzIGJsb2NrLCB3aGljaCBoYXMgYW4KPiBpZGVudGljYWwg
Y29uZGl0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
