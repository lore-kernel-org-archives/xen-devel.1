From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] amd/iommu: fix present bit
 checking when clearing PTE
Date: Wed, 23 Jan 2019 11:29:28 +0100
Message-ID: <3cd10473-16ad-6bb6-bc8a-0ecc160e9bd7@suse.com>
References: <20190123094755.72146-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l+rE=P7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gmFmo-00029W-79
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 10:29:34 +0000
In-Reply-To: <20190123094755.72146-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMjAxOSAxMDo0NywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBjdXJyZW50
IGNoZWNrIGZvciB0aGUgcHJlc2VudCBiaXQgaXMgd3JvbmcsIHNpbmNlIHRoZSBwcmVzZW50IGJp
dAo+IGlzIGxvY2F0ZWQgaW4gdGhlIGxvdyBwYXJ0IG9mIHRoZSBlbnRyeS4KPiAKPiBGaXhlczog
ZThhZmUxMTI0Y2MxICgiaW9tbXU6IGVsaWRlIGZsdXNoaW5nIGZvciBoaWdoZXIgb3JkZXIgbWFw
L3VubWFwIG9wZXJhdGlvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
