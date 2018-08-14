From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v3] xen-netfront: fix warn message
 as irq device name has '/'
Date: Tue, 14 Aug 2018 10:11:02 -0700 (PDT)
Message-ID: <20180814.101102.975738099798437246.davem__38231.9210017615$1534266604$gmane$org@davemloft.net>
References: <20180814152128.5477-1-xiliang@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jela=k5=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1fpcqX-0007Ie-OJ
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 17:11:05 +0000
In-Reply-To: <20180814152128.5477-1-xiliang@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xiliang@redhat.com
Cc: jgross@suse.com, netdev@vger.kernel.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogWGlhbyBMaWFuZyA8eGlsaWFuZ0ByZWRoYXQuY29tPgpEYXRlOiBUdWUsIDE0IEF1ZyAy
MDE4IDIzOjIxOjI4ICswODAwCgo+IFRoZXJlIGlzIGEgY2FsbCB0cmFjZSBnZW5lcmF0ZWQgYWZ0
ZXIgY29tbWl0IDJkNDA4YzBkNDU3NGIwMWI5ZWQ0NWUwMjUxNjg4OGJmOTI1ZTExYTkoCj4geGVu
LW5ldGZyb250OiBmaXggcXVldWUgbmFtZSBzZXR0aW5nKS4gVGhlcmUgaXMgbm8gJ2RldmljZS92
aWYveHgtcTAtdHgnIGZpbGUgZm91bmQKPiB1bmRlciAvcHJvYy9pcnEveHgvLgo+IAo+IFRoaXMg
cGF0Y2ggb25seSBwaWNrcyB1cCBkZXZpY2UgdHlwZSBhbmQgaWQgYXMgaXRzIG5hbWUuCj4gCj4g
V2l0aCB0aGUgcGF0Y2gsIG5vdyAvcHJvYy9pbnRlcnJ1cHRzIGxvb2tzIGxpa2UgYmVsb3cgYW5k
IHRoZSB3YXJuaW5nIG1lc3NhZ2UgZ29uZToKPiAgNzA6ICAgICAgICAgMjEgICAgICAgICAgMCAg
ICAgICAgICAwICAgICAgICAgIDAgICB4ZW4tZHluICAgIC1ldmVudCAgICAgdmlmMC1xMC10eAo+
ICA3MTogICAgICAgICAxNSAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgIHhlbi1k
eW4gICAgLWV2ZW50ICAgICB2aWYwLXEwLXJ4Cj4gIDcyOiAgICAgICAgIDE0ICAgICAgICAgIDAg
ICAgICAgICAgMCAgICAgICAgICAwICAgeGVuLWR5biAgICAtZXZlbnQgICAgIHZpZjAtcTEtdHgK
PiAgNzM6ICAgICAgICAgMzMgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICB4ZW4t
ZHluICAgIC1ldmVudCAgICAgdmlmMC1xMS1yeAo+ICA3NDogICAgICAgICAxMiAgICAgICAgICAw
ICAgICAgICAgIDAgICAgICAgICAgMCAgIHhlbi1keW4gICAgLWV2ZW50ICAgICB2aWYwLXEyLXR4
Cj4gIDc1OiAgICAgICAgIDI0ICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgeGVu
LWR5biAgICAtZXZlbnQgICAgIHZpZjAtcTItcngKPiAgNzY6ICAgICAgICAgMTkgICAgICAgICAg
MCAgICAgICAgICAwICAgICAgICAgIDAgICB4ZW4tZHluICAgIC1ldmVudCAgICAgdmlmMC1xMy10
eAo+ICA3NzogICAgICAgICAyMSAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgIHhl
bi1keW4gICAgLWV2ZW50ICAgICB2aWYwLXEzLXJ4Cj4gCj4gQmVsb3cgaXMgY2FsbCB0cmFjZSBp
bmZvcm1hdGlvbiB3aXRob3V0IHRoaXMgcGF0Y2g6CiAuLi4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFv
IExpYW5nIDx4aWxpYW5nQHJlZGhhdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCkFwcGxpZWQsIHRoYW5rIHlvdS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
