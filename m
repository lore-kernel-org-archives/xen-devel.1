From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/1] xen-netback: add reference from xenvif
 to backend_info to facilitate coredump analysis
Date: Fri, 12 Apr 2019 10:10:41 -0700 (PDT)
Message-ID: <20190412.101041.259784853562829642.davem__45394.6506416955$1555089108$gmane$org@davemloft.net>
References: <1555052004-31855-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jvnd=SO=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1hEzhR-0000oJ-3N
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 17:10:49 +0000
In-Reply-To: <1555052004-31855-1-git-send-email-dongli.zhang@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: dongli.zhang@oracle.com
Cc: wei.liu2@citrix.com, netdev@vger.kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org, junxiao.bi@oracle.com, paul.durrant@citrix.com, jie.l.li@oracle.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KRGF0ZTogRnJpLCAx
MiBBcHIgMjAxOSAxNDo1MzoyNCArMDgwMAoKPiBEdXJpbmcgY29yZWR1bXAgYW5hbHlzaXMsIGl0
IGlzIG5vdCBlYXN5IHRvIG9idGFpbiB0aGUgYWRkcmVzcyBvZgo+IGJhY2tlbmRfaW5mbyBpbiB4
ZW4tbmV0YmFjay4KPiAKPiBTbyBmYXIgdGhlcmUgYXJlIHR3byB3YXlzIHRvIG9idGFpbiBiYWNr
ZW5kX2luZm86Cj4gCj4gMS4gRG8gd2hhdCB4ZW5idXNfZGV2aWNlX2ZpbmQoKSBkb2VzIGZvciB2
bWNvcmUgdG8gZmluZCB0aGUgeGVuYnVzX2RldmljZQo+IGFuZCB0aGVuIGRlcml2ZSBpdCBmcm9t
IGRldl9nZXRfZHJ2ZGF0YSgpLgo+IAo+IDIuIEV4dHJhY3QgYmFja2VuZF9pbmZvIGZyb20gY2Fs
bHN0YWNrIG9mIHhlbndhdGNoIChlLmcuLCBuZXRiYWNrX3JlbW92ZSgpCj4gb3IgZnJvbnRlbmRf
Y2hhbmdlZCgpKS4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSByZWZlcmVuY2UgZnJvbSB4ZW52aWYg
dG8gYmFja2VuZF9pbmZvIHNvIHRoYXQgaXQgd291bGQgYmUKPiBtdWNoIG1vcmUgZWFzaWVyIHRv
IG9idGFpbiBiYWNrZW5kX2luZm8gZHVyaW5nIGNvcmVkdW1wIGFuYWx5c2lzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+CgpBcHBsaWVk
IHRvIG5ldC1uZXh0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
