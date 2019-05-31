From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen: remove on-stack cpumask from
 stop_machine_run()
Date: Fri, 31 May 2019 11:21:03 -0700
Message-ID: <be74c55b-47b8-3334-7d7b-c204869b9c8c@citrix.com>
References: <20190531115303.16459-1-jgross@suse.com>
 <5CF126F3020000780023403A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWm9P-0002V1-KT
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 18:21:11 +0000
In-Reply-To: <5CF126F3020000780023403A@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAwNjowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMDUuMTkg
YXQgMTM6NTMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBUaGUgImFsbGJ1dHNlbGYiIGNw
dW1hc2sgaW4gc3RvcF9tYWNoaW5lX3J1bigpIGlzIG5vdCBuZWVkZWQuIEluc3RlYWQKPj4gb2Yg
YWxsb2NhdGluZyBpdCBvbiB0aGUgc3RhY2sgaXQgY2FuIGVhc2lseSBiZSBhdm9pZGVkLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkxHVE0uwqAgQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
