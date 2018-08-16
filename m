From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/setup: Avoid OoB E820 lookup when
 calculating the L1TF safe address
Date: Thu, 16 Aug 2018 17:45:07 +0200
Message-ID: <20180816154507.7g2npokvifqjbatm@mac>
References: <1534433277-29436-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1534433277-29436-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgMDQ6Mjc6NTdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBIG51bWJlciBvZiBjb3JuZXIgY2FzZXMgKG1vc3Qgb2J2aW91c2x5LCBuby1yZWFs
LW1vZGUgYW5kIG5vIE11bHRpYm9vdCBtZW1vcnkKPiBtYXApIGNhbiBlbmQgdXAgd2l0aCBlODIw
X3Jhdy5ucl9tYXAgYmVpbmcgMCwgYXQgd2hpY2ggcG9pbnQgdGhlIEwxVEYKPiBjYWxjdWxhdGlv
biB3aWxsIHVuZGVyZmxvdy4KPiAKPiBTcG90dGVkIGJ5IENvdmVyaXR5Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
