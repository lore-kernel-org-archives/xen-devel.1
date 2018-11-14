From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v6.1 05/11] libxl_qmp: Implementation of
 libxl__ev_qmp_*
Date: Wed, 14 Nov 2018 17:07:30 +0000
Message-ID: <23532.22098.906750.732501@mariner.uk.xensource.com>
References: <20181113122844.17908-1-anthony.perard@citrix.com>
 <23530.52790.262983.714138@mariner.uk.xensource.com>
 <20181113154254.GJ1302@perard.uk.xensource.com>
 <23530.63341.244254.286242@mariner.uk.xensource.com>
 <20181114114025.GK1302@perard.uk.xensource.com>
 <23532.17069.90374.75227@mariner.uk.xensource.com>
 <20181114163315.GL1302@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c2by=nz=citrix.com=prvs=849dfa6a4=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gMydx-0004NJ-7T
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 17:07:57 +0000
In-Reply-To: <20181114163315.GL1302@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2Ni4xIDA1LzExXSBsaWJ4bF9xbXA6
IEltcGxlbWVudGF0aW9uIG9mIGxpYnhsX19ldl9xbXBfKiIpOgo+IFRoZSBjdXJyZW50IGltcGxl
bWVudGF0aW9uIGFscmVhZHkgY2xlYW51cCB0aGUgYnJva2VuIHN0YXRlIGJlZm9yZSB0aGUKPiBj
b250cm9sIGlzIHBhc3NlZCBvdXRzaWRlIGV2X3FtcCBpbXBsZW1lbnRhdGlvbi4gVGhhdCByZXN1
bHQgaW4gdGhlIElkbGUKPiBwdWJsaWMgc3RhdGUuIFdoZW5ldmVyIGFuIGludGVybmFsIGZ1bmN0
aW9uIHRocm93IGFuIGVycm9yLCBpdCBsZXRzIHRoZQo+IG1haW4gZnVuY3Rpb24gcW1wX2V2X2Zk
X2NhbGxiYWNrIHRha2luZyBjYXJlIG9mIGNsZWFudXAgdGhlIGBicm9rZW5gIHN0YXRlCj4gc28g
dGhhdCB3aGVuIHRoZSBjb250cm9sIHBhc3NlcyBvdXRzaWRlIGV2X3FtcCBpbXBsZW1lbnRhdGlv
biB0aGUgc3RhdGUKPiBpcyBkaXNjb25uZWN0ZWQvSWRsZS4KCkFoIHJpZ2h0LgoKPiBBbiBpbnRl
cm5hbCBgYnJva2VuYCBzdGF0ZSBpcyBqdXN0IGFuIGhhbGYtdHJhbnNpdGlvbiB0b3dhcmQgdGhl
Cj4gZGlzY29ubmVjdGVkL0lkbGUgc3RhdGUuCj4gCj4gSSBndWVzcyBJIGNvdWxkIGFkZCB0byB0
aGUgaW50ZXJuYWwgc3RhdGUgZG9jdW1lbnRhdGlvbjoKPiAKPiAgIFdoZW4gYW4gaW50ZXJuYWwg
ZnVuY3Rpb24gcmV0dXJuIGFuIGVycm9yLCBpdCBjYW4gbGVhdmUgZXZfcW1wIGluIGEKPiAgIGBi
cm9rZW5gIHN0YXRlIGJ1dCBvbmx5IGlmIHRoZSBjYWxsZXIgaXMgYW5vdGhlciBpbnRlcm5hbCBm
dW5jdGlvbi4KPiAgIFRoYXQgYGJyb2tlbmAgbmVlZHMgdG8gYmUgY2xlYW5lZCB1cCwgZS5pLiB0
cmFuc2l0aW9ubmVkIHRvIHRoZQo+ICAgYGRpc2Nvbm5lY3RlZGAgc3RhdGUsIGJlZm9yZSB0aGUg
Y29udHJvbCBvZiBldl9xbXAgaXMgcmVsZWFzZWQKPiAgIG91dHNpZGVzIG9mIGV2X3FtcCBpbXBs
ZW1lbnRhdGlvbi4KCklmIHlvdSBkbyB0aGlzIHlvdSBuZWVkIHRvIGRlc2NyaWJlIHdoYXQga2lu
ZHMgb2Ygc3RhdGVzIGFyZSBsZWdhbApgYnJva2VuJyBzdGF0ZXMuICBUaGlzIGlzIHByb2JhYmx5
IG11c3QgZWFzaWx5IGRvbmUgYnkgbWFraW5nIHRoZQpgYnJva2VuJyBzdGF0ZSBhIHByb3BlciBm
aXJzdC1jbGFzcyBpbnRlcm5hbCBzdGF0ZSAoZ2l2aW5nIGl0IGFuIGVudHJ5CmluIHRoZSBzdGF0
ZSB0YWJsZSksIGJ1dCBzdGF0aW5nLCBhcyB5b3UgZG8gYWJvdmUsIHRoYXQgaXQgaXMgbm90CnZp
c2libGUgZXh0ZXJuYWxseSBiZWNhdXNlIGl0J3MgYWx3YXlzIHRpZGllZCBpbnRvIGBkaXNjb25u
ZWN0ZWQnCmJlZm9yZSBjb250cm9sIHBhc3NlcyBvdXRzaWRlIGV2X3FtcC4KCklhbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
