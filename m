From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V11 4/5] p2m: Always use hostp2m when
 clipping rangesets
Date: Thu, 20 Dec 2018 07:49:59 -0700
Message-ID: <5C1BAC170200007800208176@prv1-mh.provo.novell.com>
References: <1544001488-23763-1-git-send-email-rcojocaru@bitdefender.com>
 <1544001488-23763-5-git-send-email-rcojocaru@bitdefender.com>
 <5C07FD4302000078002033AF@prv1-mh.provo.novell.com>
 <5e22ea77-26f9-be55-c30f-8a598cd35218@bitdefender.com>
 <5C1237EF0200007800205C8F@prv1-mh.provo.novell.com>
 <f3da63c2-ec2d-e7fb-468b-3faf8cf9c67b@citrix.com>
 <5C1B50D60200007800207E4D@prv1-mh.provo.novell.com>
 <efa718ea-8fdc-0803-704f-5628c3b3a10e@citrix.com>
 <5C1B9E8402000078002080F4@prv1-mh.provo.novell.com>
 <49204ce7-bb5f-2aad-a2b8-a2219db89260@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZzeD-0004DK-Qj
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 14:50:01 +0000
In-Reply-To: <49204ce7-bb5f-2aad-a2b8-a2219db89260@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDE1OjM4LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBDYW4gd2UganVzdCBmb3Igbm93IHRha2UgdGhlIHRleHQgYXMgSSBwcm9wb3NlZCBpdD8g
IFlvdSBjYW4gYXJndWUgYWJvdXQKPiB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gd2hlbiB3ZSBkbyB0
aGUgYWxsZWdlZCBjbGVhbi11cC4KCldpdGggdGhlICJXZSBzaG91bGQgcHJvYmFibHkgcmV0dXJu
IGFuIGVycm9yIC4uLiIgcGFydCBkcm9wcGVkCm9yIHJlcGxhY2VkIGJ5IGUuZy4gIldlIHNob3Vs
ZCByZXZpc2l0IHRoaXMiIHRoaXMgd291bGQgYmUgb2theQp3aXRoIG1lLiBCdXQgeW91J3JlIHRo
ZSBtYWludGFpbmVyIG9mIHRoZSBjb2RlIGFueXdheS4uLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
