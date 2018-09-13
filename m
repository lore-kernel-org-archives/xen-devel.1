From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen/netfront: don't bug in case of too many
 frags
Date: Thu, 13 Sep 2018 08:22:43 -0700 (PDT)
Message-ID: <20180913.082243.1622516360155710681.davem__23893.4636269279$1536852083$gmane$org@davemloft.net>
References: <20180911070448.3958-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jngy=l3=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1g0TSA-0000iV-8D
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 15:22:46 +0000
In-Reply-To: <20180911070448.3958-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com
Cc: netdev@vger.kernel.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiBUdWUsIDExIFNlcCAy
MDE4IDA5OjA0OjQ4ICswMjAwCgo+IENvbW1pdCA1N2YyMzBhYjA0ZDI5MSAoInhlbi9uZXRmcm9u
dDogcmFpc2UgbWF4IG51bWJlciBvZiBzbG90cyBpbgo+IHhlbm5ldF9nZXRfcmVzcG9uc2VzKCki
KSByYWlzZWQgdGhlIG1heCBudW1iZXIgb2YgYWxsb3dlZCBzbG90cyBieSBvbmUuCj4gVGhpcyBz
ZWVtcyB0byBiZSBwcm9ibGVtYXRpYyBpbiBzb21lIGNvbmZpZ3VyYXRpb25zIHdpdGggbmV0YmFj
ayB1c2luZwo+IGEgbGFyZ2VyIE1BWF9TS0JfRlJBR1MgdmFsdWUgKGUuZy4gb2xkIExpbnV4IGtl
cm5lbCB3aXRoIE1BWF9TS0JfRlJBR1MKPiBkZWZpbmVkIGFzIDE4IGluc3RlYWQgb2Ygbm93YWRh
eXMgMTcpLgo+IAo+IEluc3RlYWQgb2YgQlVHX09OKCkgaW4gdGhpcyBjYXNlIGp1c3QgZmFsbCBi
YWNrIHRvIHJldHJhbnNtaXNzaW9uLgo+IAo+IEZpeGVzOiA1N2YyMzBhYjA0ZDI5MSAoInhlbi9u
ZXRmcm9udDogcmFpc2UgbWF4IG51bWJlciBvZiBzbG90cyBpbiB4ZW5uZXRfZ2V0X3Jlc3BvbnNl
cygpIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkFwcGxpZWQuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
