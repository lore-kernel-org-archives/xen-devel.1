From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 08/12] xen/gnttab: Fold
 grant_table_{create, set_limits}() into grant_table_init()
Date: Tue, 14 Aug 2018 16:31:37 +0200
Message-ID: <20180814143137.tbbb5tpuiehmuu2o@mac>
References: <1534154469-6076-1-git-send-email-andrew.cooper3@citrix.com>
 <1534154469-6076-9-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1534154469-6076-9-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMTMsIDIwMTggYXQgMTE6MDE6MDVBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBOb3cgdGhhdCB0aGUgbWF4X3tncmFudCxtYXB0cmFja31fZnJhbWVzIGFyZSBzcGVj
aWZpZWQgZnJvbSB0aGUgdmVyeSBiZWdpbm5pbmcKPiBvZiBncmFudCB0YWJsZSBjb25zdHJ1Y3Rp
b24sIHRoZSB2YXJpb3VzIGluaXRpYWxpc2F0aW9uIGZ1bmN0aW9ucyBjYW4gYmUKPiBmb2xkZWQg
dG9nZXRoZXIgYW5kIHNpbXBsaWZpZWQgYXMgYSByZXN1bHQuCj4gCj4gTGVhdmUgZ3JhbnRfdGFi
bGVfaW5pdCgpIGFzIHRoZSBwdWJsaWMgaW50ZXJmYWNlLCB3aGljaCBpcyBtb3JlIGNvbnNpc3Rl
bnQKPiB3aXRoIG90aGVyIHN1YnN5c3RlbXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
