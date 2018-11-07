From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: Guest soft lockups with "xen: make xen_qlock_wait()
 nestable"
Date: Wed, 7 Nov 2018 17:53:23 -0500
Message-ID: <3822be62-24a6-9ee6-a62b-88d969373ec9@oracle.com>
References: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
 <9db95104-1378-f40e-db3a-8ccd2aa89b9f@oracle.com>
 <2dad0537-6efe-16f3-6d8e-5d25002aa9c3@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k86m=ns=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gKWhe-0008NQ-7O
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 22:53:38 +0000
In-Reply-To: <2dad0537-6efe-16f3-6d8e-5d25002aa9c3@eikelenboom.it>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>, Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvNy8xOCA1OjQ1IFBNLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4gT24gMDcvMTEv
MTggMjM6MzQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMTEvNy8xOCA0OjMwIEFNLCBT
YW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+PiBIaSBKdWVyZ2VuIC8gQm9yaXMsCj4+Pgo+Pj4g
TGFzdCB3ZWVrIGkgdGVzdGVkIExpbnV4IGtlcm5lbCA0LjE5LjAgc3RhYmxlIHdpdGggdGhlIFhl
biAiZm9yLWxpbnVzLTQuMjAiIGJyYW5jaCBwdWxsZWQgb24gdG9wLgo+Pj4gVW5mb3J0dW5hdGVs
eSBpIHdhcyBzZWVpbmcgZ3Vlc3RzIGxvY2t1cCBhZnRlciBzb21lIHRpbWUsIHNlZSBiZWxvdyBm
b3IgdGhlIGxvZ2dpbmcgZnJvbSBvbmUgb2YgdGhlIGd1ZXN0Cj4+PiB3aGljaCBpIHdhcyBhYmxl
IHRvIGNhcHR1cmUuCj4+PiBSZXZlcnRpbmcgInhlbjogbWFrZSB4ZW5fcWxvY2tfd2FpdCgpIG5l
c3RhYmxlIiA3MjUwZjZkMzU2ODFkZmM0NDc0OWQ5MDU5OGEyZDUxYTExOGNlMmI4LAo+Pj4gbWFk
ZSB0aGUgbG9ja3VwcyBkaXNhcHBlYXIuCj4+Pgo+Pj4gVGhlc2UgZ3Vlc3RzIGFyZSBzdHJlc3Nl
ZCBxdWl0ZSBoYXJkIGluIGJvdGggQ1BVIGFuZCBuZXR3b3JraW5nLCAKPj4+IHNvIHRoZXkgYXJl
IHByb2JhYmx5IG1vcmUgc3VzY2VwdGlibGUgdG8gbG9ja2luZyBpc3N1ZXMuCj4+Pgo+Pj4gU3lz
dGVtIGlzIGEgQU1EIHBoZW5vbSB4NiwgcnVubmluZyBYZW4tdW5zdGFibGUuCj4+Pgo+Pj4gQW55
IGlkZWFzID8KPj4KPj4gQnkgYW55IGNoYW5jZSwgaXMgVk1QVSBvbj8KPj4KPj4KPj4gLWJvcmlz
Cj4+Cj4gSGFkIHRvIGxvb2sgdXAgd2hhdCB0aGF0IGlzIDopLCBidXQgc2VlbXMgb25seSBhcHBs
aWNhYmxlIHRvIFBWIGd1ZXN0cyBpZiBpJ20gY29ycmVjdCA/CgpObywgaXQgaXMgYXBwbGljYWJs
ZSB0byBIVk0gZ3Vlc3RzIGFzIHdlbGwuCgo+Cj4gSSdtIG9ubHkgcnVubmluZyBQVkggYW5kIEhW
TSBndWVzdHMgYXQgdGhlIG1vbWVudCwgZXhjZXB0IGZvciBkb20wIG9mIGNvdXJzZSwKPiB3aGlj
aCByZXBvcnRzOgo+ICAgICBbICAgIDAuOTQxNDA3XSBWUE1VIGRpc2FibGVkIGJ5IGh5cGVydmlz
b3IuCgpPSywgeW91IGRvbid0IGhhdmUgaXQuIChJIGFza2VkIGJlY2F1c2UgSSB3YXMgdGhpbmtp
bmcgb2YgTk1JcykKCi1ib3JpcwoKPgo+IFRoZXNlIHNvZnQgbG9ja3VwcyB3ZXJlIGluIGEgSFZN
IGd1ZXN0IChpZiBpIHJlbWVtYmVyIGNvcnJlY3RseSwgaSBoYXZlIHNlZW4KPiBhIFBWSCBndWVz
dCBsb2NrdXAgYXMgd2VsbCBhZnRlciBhIHdoaWxlIChhbHNvIGEgcXVpdGUgaGVhdnkgY3B1L25l
dHdvcmsgc3RyZXNzZWQgb25lKS4KPgo+IC0tCj4gU2FuZGVyCj4KPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
