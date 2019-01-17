From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] tools: add new xl command get-config
 for getting hypervisor config
Date: Thu, 17 Jan 2019 16:18:55 +0100
Message-ID: <b33eac34-c01e-ef30-1a2d-054eecf6652a@suse.com>
References: <20190117145722.30311-1-jgross@suse.com>
 <20190117145722.30311-3-jgross@suse.com>
 <20190117151250.63mbb3pgs56ztxop@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yQ28=PZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gk9SX-0003Hk-MZ
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 15:19:57 +0000
In-Reply-To: <20190117151250.63mbb3pgs56ztxop@zion.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDEvMjAxOSAxNjoxMiwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAxNywgMjAx
OSBhdCAwMzo1NzoyMlBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBBZGQgICBuZXcg
c3ViY29tbWFuZCAiZ2V0LWNvbmZpZyIgdG8geGwgY29uZmlnIHRvIHByaW50IHRoZSBoeXBlcnZp
c29yCj4+IC5jb25maWcgZmlsZS4KPiAKPiBJIHNsaWdodCBwcmVmZXIgZ2V0LXhlbi1jb25maWcg
b3IgZ2V0LWh5cGVydmlzb3ItY29uZmlnLgoKSSdkIGJlIGhhcHB5IHdpdGggZWl0aGVyLgoKQW55
Ym9keSBlbHNlIGdvdCBhIHNwZWNpYWwgcHJlZmVyZW5jZT8KCj4gCj4+Cj4+IFRvIGJlIGFibGUg
dG8gcmV1c2UgYWxyZWFkeSBleGlzdGluZyBkZWNvbXByZXNzaW5nIGNvZGUgaW4gbGlieGVuZ3Vl
c3QKPj4geGNfaW5mbGF0ZV9idWZmZXIoKSBoYXMgdG8gYmUgbW92ZWQgdG8gbGlieGVuZ3Vlc3Qu
aC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+
IFsuLi5dCj4+ICAKPj4gK2ludCBsaWJ4bF9nZXRfY29uZmlnKGxpYnhsX2N0eCAqY3R4LCBjaGFy
ICoqYnVmZmVyKQo+PiArewo+PiArICAgIGludCByZXQ7Cj4+ICsgICAgdW5zaWduZWQgbG9uZyBn
el9zaXplLCBvdXRfc2l6ZTsKPj4gKyAgICBjaGFyICpnel9idWZmZXI7Cj4+ICsgICAgR0NfSU5J
VChjdHgpOwo+PiArCj4+ICsgICAgcmV0ID0geGNfZ2V0X2NvbmZpZyhjdHgtPnhjaCwgJmd6X2J1
ZmZlciwgJmd6X3NpemUpOwo+PiArICAgIGlmIChyZXQgPCAwKSB7Cj4+ICsgICAgICAgIExPR0VW
KEVSUk9SLCByZXQsICJnZXR0aW5nIGNvbmZpZyIpOwo+PiArICAgICAgICBHQ19GUkVFOwo+PiAr
ICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsKPj4gKyAgICB9Cj4+ICsKPj4gKyAgICAqYnVmZmVy
ID0geGNfaW5mbGF0ZV9idWZmZXIoY3R4LT54Y2gsIGd6X2J1ZmZlciwgZ3pfc2l6ZSwgJm91dF9z
aXplKTsKPj4gKwo+PiArICAgIEdDX0ZSRUU7Cj4gCj4gUGxlYXNlIG1vdmUgdGhpcyB0byB0aGUg
ZW5kIG9mIHRoZSBmdW5jdGlvbiBhbmQgLi4uCj4gCj4+ICsgICAgZnJlZShnel9idWZmZXIpOwo+
PiArCj4+ICsgICAgaWYgKCEqYnVmZmVyKSB7Cj4+ICsgICAgICAgIExPR0UoRVJST1IsICJkZWNv
bXByZXNzaW5nIGNvbmZpZyBkYXRhIGZhaWxlZCIpOwo+PiArICAgICAgICByZXR1cm4gRVJST1Jf
RkFJTDsKPiAKPiAuLi4gdXNlIGdvdG8gc3R5bGUgaW5zdGVhZC4KCk9rYXkuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
