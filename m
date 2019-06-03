From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 1/5] xen/vm-event: Drop unused u_domctl
 parameter from vm_event_domctl()
Date: Mon, 3 Jun 2019 16:52:11 +0300
Message-ID: <bb369f74-a8e1-3c6e-affa-dffa6a1e1f81@bitdefender.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGpH=UC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hXnNq-00043a-DP
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 13:52:18 +0000
In-Reply-To: <1559564728-17167-2-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gNi8zLzE5IDM6MjUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhpcyBwYXJhbWV0ZXIg
aXNuJ3QgdXNlZCBhdCBhbGwuICBGdXRoZXJtb3JlLCBlbGlkZSB0aGUgY29weWJhY2sgaW4KPiBm
YWlsaW5nIGNhc2VzLCBhcyBpdCBpcyBvbmx5IHN1Y2Nlc3NmdWwgcGF0aHMgd2hpY2ggZ2VuZXJh
dGUgZGF0YSB3aGljaAo+IG5lZWRzIHNlbmRpbmcgYmFjayB0byB0aGUgY2FsbGVyLgo+IAo+IEZp
bmFsbHksIGRyb3AgYSByZWR1bmRhbnQgZCA9PSBOVUxMIGNoZWNrLCBhcyB0aGF0IGxvZ2ljIGlz
IGFsbCBjb21tb24KPiBhdCB0aGUgYmVnaW5pbmcgb2YgZG9fZG9tY3RsKCkuCj4gCj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
