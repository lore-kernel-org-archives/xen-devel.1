From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.12] libs/gnttab: add missing FreeBSD
 functions
Date: Tue, 19 Feb 2019 16:06:38 +0000
Message-ID: <20190219160638.wwo5qxg7sr7orekl@zion.uk.xensource.com>
References: <20190219152608.23768-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kUDC=Q2=citrix.com=prvs=94638e76f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gw7uv-0006EO-JJ
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 16:06:45 +0000
Content-Disposition: inline
In-Reply-To: <20190219152608.23768-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgMDQ6MjY6MDhQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZSBGcmVlQlNEIGltcGxlbWVudGF0aW9uIGlzIG1pc3NpbmcgdGhlIGZvbGxv
d2luZyBmdW5jdGlvbnM6Cj4gCj4gb3NkZXBfZ250dGFiX2RtYWJ1Zl9leHBfZnJvbV9yZWZzCj4g
b3NkZXBfZ250dGFiX2RtYWJ1Zl9leHBfd2FpdF9yZWxlYXNlZAo+IG9zZGVwX2dudHRhYl9kbWFi
dWZfaW1wX3RvX3JlZnMKPiBvc2RlcF9nbnR0YWJfZG1hYnVmX2ltcF9yZWxlYXNlCj4gCj4gV2hp
Y2ggYWxsIGRlYWwgd2l0aCBkbWFidWZzLCB0aGF0IG9ubHkgZXhpc3RzIG9uIExpbnV4LiBJbXBs
ZW1lbnQgdGhlbQo+IHVzaW5nIGFib3J0LCBzaW5jZSBzdWNoIGZ1bmN0aW9ucyBzaG91bGQgbmV2
ZXIgYmUgY2FsbGVkIG9uIEZyZWVCU0QuCj4gCj4gRlRSLCBJIHJlYWxpemVkIHRob3NlIGZ1bmN0
aW9ucyB3aGVyZSBtaXNzaW5nIHdoZW4gYXR0ZW1wdGluZyB0byB1c2UKPiBweWdydWI6Cj4gCj4g
VHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgo+ICAgRmlsZSAiL3Vzci9sb2NhbC9s
aWIveGVuL2Jpbi9weWdydWIiLCBsaW5lIDE5LCBpbiA8bW9kdWxlPgo+ICAgICBpbXBvcnQgeGVu
Lmxvd2xldmVsLnhjCj4gSW1wb3J0RXJyb3I6IC91c3IvbG9jYWwvbGliL2xpYnhlbmdudHRhYi5z
by4xOiBVbmRlZmluZWQgc3ltYm9sICJvc2RlcF9nbnR0YWJfZG1hYnVmX2V4cF9mcm9tX3JlZnMi
Cj4gCj4gRml4ZXM6IGVlODEwNSAoImxpYmdudHRhYjogQWRkIHN1cHBvcnQgZm9yIExpbnV4IGRt
YS1idWYiKQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+IC0tLQo+IENjOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKCkFja2VkLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQ0MgSnVlcmdlbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
