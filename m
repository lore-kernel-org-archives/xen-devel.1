From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen-netfront: wait xenbus state change when
 load module manually
Date: Sun, 29 Jul 2018 08:30:40 -0700 (PDT)
Message-ID: <20180729.083040.53901922165497594.davem__27569.6792793044$1532878200$gmane$org@davemloft.net>
References: <20180727095608.25210-1-xiliang@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zxf4=kn=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1fjneh-0002ON-DS
 for xen-devel@lists.xenproject.org; Sun, 29 Jul 2018 15:30:47 +0000
In-Reply-To: <20180727095608.25210-1-xiliang@redhat.com>
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

RnJvbTogWGlhbyBMaWFuZyA8eGlsaWFuZ0ByZWRoYXQuY29tPgpEYXRlOiBGcmksIDI3IEp1bCAy
MDE4IDE3OjU2OjA4ICswODAwCgo+IEBAIC0xMzMwLDYgKzEzMzEsMTEgQEAgc3RhdGljIHN0cnVj
dCBuZXRfZGV2aWNlICp4ZW5uZXRfY3JlYXRlX2RldihzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2
KQo+ICAJbmV0aWZfY2Fycmllcl9vZmYobmV0ZGV2KTsKPiAgCj4gIAl4ZW5idXNfc3dpdGNoX3N0
YXRlKGRldiwgWGVuYnVzU3RhdGVJbml0aWFsaXNpbmcpOwo+ICsJd2FpdF9ldmVudChtb2R1bGVf
bG9hZF9xLAo+ICsJCQkgICB4ZW5idXNfcmVhZF9kcml2ZXJfc3RhdGUoZGV2LT5vdGhlcmVuZCkg
IT0KPiArCQkJICAgWGVuYnVzU3RhdGVDbG9zZWQgJiYKPiArCQkJICAgeGVuYnVzX3JlYWRfZHJp
dmVyX3N0YXRlKGRldi0+b3RoZXJlbmQpICE9Cj4gKwkJCSAgIFhlbmJ1c1N0YXRlVW5rbm93bik7
Cj4gIAlyZXR1cm4gbmV0ZGV2Owo+ICAKPiAgIGV4aXQ6CgpXaGF0IHBlcmZvcm1zIHRoZSB3YWtl
dXBzIHRoYXQgd2lsbCB0cmlnZ2VyIGZvciB0aGlzIHNsZWVwIHNpdGU/CgpUaGFuayB5b3UuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
