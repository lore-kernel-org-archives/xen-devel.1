From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/1] xen-netback: add reference from xenvif
 to backend_info to facilitate coredump analysis
Date: Fri, 12 Apr 2019 15:28:51 +0100
Message-ID: <20190412142851.GK30543__33866.4910801285$1555079394$gmane$org@zion.uk.xensource.com>
References: <1555052004-31855-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VTWF=SO=citrix.com=prvs=99843409f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hExAm-0003YR-8U
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 14:28:56 +0000
Content-Disposition: inline
In-Reply-To: <1555052004-31855-1-git-send-email-dongli.zhang@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: wei.liu2@citrix.com, netdev@vger.kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org, junxiao.bi@oracle.com, paul.durrant@citrix.com, jie.l.li@oracle.com, xen-devel@lists.xenproject.org, davem@davemloft.net
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMDI6NTM6MjRQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IER1cmluZyBjb3JlZHVtcCBhbmFseXNpcywgaXQgaXMgbm90IGVhc3kgdG8gb2J0YWlu
IHRoZSBhZGRyZXNzIG9mCj4gYmFja2VuZF9pbmZvIGluIHhlbi1uZXRiYWNrLgo+IAo+IFNvIGZh
ciB0aGVyZSBhcmUgdHdvIHdheXMgdG8gb2J0YWluIGJhY2tlbmRfaW5mbzoKPiAKPiAxLiBEbyB3
aGF0IHhlbmJ1c19kZXZpY2VfZmluZCgpIGRvZXMgZm9yIHZtY29yZSB0byBmaW5kIHRoZSB4ZW5i
dXNfZGV2aWNlCj4gYW5kIHRoZW4gZGVyaXZlIGl0IGZyb20gZGV2X2dldF9kcnZkYXRhKCkuCj4g
Cj4gMi4gRXh0cmFjdCBiYWNrZW5kX2luZm8gZnJvbSBjYWxsc3RhY2sgb2YgeGVud2F0Y2ggKGUu
Zy4sIG5ldGJhY2tfcmVtb3ZlKCkKPiBvciBmcm9udGVuZF9jaGFuZ2VkKCkpLgo+IAo+IFRoaXMg
cGF0Y2ggYWRkcyBhIHJlZmVyZW5jZSBmcm9tIHhlbnZpZiB0byBiYWNrZW5kX2luZm8gc28gdGhh
dCBpdCB3b3VsZCBiZQo+IG11Y2ggbW9yZSBlYXNpZXIgdG8gb2J0YWluIGJhY2tlbmRfaW5mbyBk
dXJpbmcgY29yZWR1bXAgYW5hbHlzaXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG9uZ2xpIFpoYW5n
IDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
