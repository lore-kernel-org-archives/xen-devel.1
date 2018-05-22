From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v2 0/2] Release process: lesson to learn
Date: Tue, 22 May 2018 17:45:21 +0100
Message-ID: <1527007523-23576-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3e1g=ij=citrix.com=prvs=6736f4111=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLAPt-0005aW-Ud
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 16:45:41 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CgpUaGlzIGlzIG15
IHRoaXJkIGF0dGVtcHQgdG8gZ2V0IGNvbnNlbnN1cyBmb3IgdGhpcy4gIFdlIGhhZCBhCmRpc2N1
c3Npb24gYWJvdXQgdGhpcyBpbiBEZWNlbWJlciBhbmQgYWdhaW4gaW4gQXByaWwuCgpUZWNobmlj
YWxseSBJIHRoaW5rIHRoZSBmYWN0IHRoYXQgSSBoYXZlIEp1ZXJnZW4ncyBhY2sgb24gdGhlCmNv
bnRyb3ZlcnNpYWwgcGF0Y2ggb3VnaHQgdG8gYmUgc3VmZmljaWVudCwgc2luY2UgaGUgaXMgdGhl
IFJNLCBidXQgSQp3b3VsZCBwcmVmZXIgdG8gcHJvY2VlZCB3aXRoIGNvbnNlbnN1cy4KClNvIEkg
aGF2ZSBhZGRlZCBhIG5ldyBwYXRjaCB0byBleHBsaWNpdGx5IHN0YXRlIHRoYXQgZXZlcnl0aGlu
ZyBpbgp0aGlzIGRpcmVjdG9yeSBpcyBndWlkZWxpbmVzLgoKSWFuIEphY2tzb24gKDIpOgogIGRv
Y3MvcHJvY2VzczogQWRkIFJVQlJJQwogIGRvY3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1tYW5hZ2Vt
ZW50OiBMZXNzb24gdG8gbGVhcm4KCiBkb2NzL3Byb2Nlc3MvUlVCUklDICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysKIGRvY3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1t
YW5hZ2VtZW50LnBhbmRvYyB8ICA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL3Byb2Nlc3MvUlVCUklDCgotLSAKMi4xLjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
