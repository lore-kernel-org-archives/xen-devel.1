From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/setup: Avoid OoB E820 lookup when
 calculating the L1TF safe address
Date: Thu, 16 Aug 2018 18:02:33 +0100
Message-ID: <20180816170233.ksspszmi3fgdoaja@citrix.com>
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
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgMDQ6Mjc6NTdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBIG51bWJlciBvZiBjb3JuZXIgY2FzZXMgKG1vc3Qgb2J2aW91c2x5LCBuby1yZWFs
LW1vZGUgYW5kIG5vIE11bHRpYm9vdCBtZW1vcnkKPiBtYXApIGNhbiBlbmQgdXAgd2l0aCBlODIw
X3Jhdy5ucl9tYXAgYmVpbmcgMCwgYXQgd2hpY2ggcG9pbnQgdGhlIEwxVEYKPiBjYWxjdWxhdGlv
biB3aWxsIHVuZGVyZmxvdy4KPiAKPiBTcG90dGVkIGJ5IENvdmVyaXR5Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
