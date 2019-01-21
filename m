From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/3] x86/pvh-dom0: Remove unnecessary
 function pointer call from modify_identity_mmio()
Date: Mon, 21 Jan 2019 15:52:33 +0000
Message-ID: <20190121155233.h32aari3tvmzziy7@zion.uk.xensource.com>
References: <1548085041-23786-1-git-send-email-andrew.cooper3@citrix.com>
 <1548085041-23786-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1548085041-23786-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDM6Mzc6MTlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBGdW5jdGlvbiBwb2ludGVyIGNhbGxzIGFyZSBmYXIgbW9yZSBleHBlbnNpdmUgaW4g
YSBwb3N0LVNwZWN0cmUgd29ybGQsIGFuZAo+IHRoaXMgb25lIGRvZXNuJ3QgbmVlZCB0byBiZS4K
PiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+CgpUaGlzIGlzbid0IGEgaG90IHBhdGggdGhvdWdoLCBzbyBJIHdv
dWxkbid0IGJlIHRvbyBjb25jZXJuZWQgYWJvdXQgdGhlCnBlcmZvcm1hbmNlIGFzcGVjdCBvZiBm
dW5jdGlvbiBwb2ludGVyIGNhbGxzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
