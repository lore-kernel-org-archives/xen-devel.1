From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 13 Dec 2018 07:46:36 -0700
Message-ID: <5C1270CC0200007800205E5A@prv1-mh.provo.novell.com>
References: <20181212152056.20480-1-olaf@aepfle.de>
 <5C1139BD0200007800205934@prv1-mh.provo.novell.com>
 <20181213091845.54212b83.olaf@aepfle.de>
 <5C121C330200007800205BC8@prv1-mh.provo.novell.com>
 <20181213100442.3510b91b.olaf@aepfle.de>
 <5C1237680200007800205C8C@prv1-mh.provo.novell.com>
 <20181213142559.78a19242.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXSG9-0006WF-Kp
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:46:41 +0000
In-Reply-To: <20181213142559.78a19242.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE4IGF0IDE0OjI1LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IFRoZSBx
dWVzdGlvbiBpcywgaG93IG11Y2ggZHJpZnQgY2FuIGJlIHRvbGVyYXRlZCBldmVuIHdpdGhvdXQg
bXkgcGF0Y2guCgpUaGlzIGRlcGVuZHMgb24gd2hhdCBhIHN5c3RlbSBpcyB1c2VkIGZvci4gQSBm
ZXcgc2Vjb25kcyBvZmYgbWF5CmJlIGZpbmUgZm9yIG9uZSBwdXJwb3NlLCBidXQgYSBzaWduaWZp
Y2FudCBwcm9ibGVtIGZvciBhbm90aGVyLgpTaW1pbGFybHkgYSBzdWRkZW4gKGhvd2V2ZXIgc21h
bGwpIGNoYW5nZSB0byB0aGUgVFNDIHRpY2sgcmF0ZQptYXkgYmUgYSBwcm9ibGVtIGZvciBvbmUg
cHVycG9zZSwgYnV0IG5vdCBmb3IgYW5vdGhlci4KCklmIG90b2ggKGFuZCBqdXN0IHRvIGdpdmUg
YW4gZXhhbXBsZSkgaXQgd2FzIGRldGVybWluZWQgdGhhdCB0aGUKVFNDIHRpY2sgcmF0ZSBvbiBh
IHBoeXNpY2FsIHN5c3RlbSB2YXJpZXMgb3ZlciB0aW1lIHdpdGhpbgpjZXJ0YWluIGJvdW5kYXJp
ZXMsIHRoZW4gbGV2ZXJhZ2luZyB0aGlzIHRvIGNoYW5nZSAoc2xvd2x5LCBpLmUuCndpdGggbm8g
c3RlZXBlciBhIGdyYWRpZW50IHRoYW4gbWlnaHQgYmUgb2JzZXJ2YWJsZSBvbiBiYXJlCmhhcmR3
YXJlKSB0aGUgcmF0ZSB0byBtYXRjaCB0aGUgbmV3IGhvc3QncyBtaWdodCBiZSBhbiBvcHRpb24u
CkVtdWxhdGlvbiB0aGVuIGNvdWxkIGJlIHR1cm5lZCBvZmYgYWZ0ZXIgYSBjZXJ0YWluIHBlcmlv
ZCBvZiB0aW1lLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
