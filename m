From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] libx86: Fix 32bit stubdom build of
 x86_cpuid_policy_fill_native()
Date: Tue, 13 Nov 2018 14:47:28 +0100
Message-ID: <20181113134728.gc5dttadij5qefir@mac>
References: <1542110355-842-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1542110355-842-1-git-send-email-andrew.cooper3@citrix.com>
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

T24gVHVlLCBOb3YgMTMsIDIwMTggYXQgMTE6NTk6MTVBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBXaXRoIC1tMzIsIEdDQyBnZW5lcmF0ZXMgYSB3YXJuaW5nIGZvciAmc2l6ZV90ID09
ICZ1bnNpZ25lZCBsb25nLCB3aGljaCBpcyB0aGUKPiB0eXBlY2hlY2sgaGlkZGVuIGluc2lkZSB0
aGUgbWluKCkgbWFjcm8uCj4gCj4gU3dpdGNoIHRvIHVzaW5nIGV4cGxpY2l0bHkgdHlwZWQgdmVy
c2lvbnMgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
