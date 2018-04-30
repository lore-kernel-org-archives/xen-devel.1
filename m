From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11 v2 0/2] Add Designated Reviewer
 (R:) to MAINTAINERS (plus a test case)
Date: Mon, 30 Apr 2018 01:56:21 -0600
Message-ID: <5AE6CC2502000078001BF7A0@prv1-mh.provo.novell.com>
References: <cover.1524851673.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfxw=ht=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fD3fg-0001g3-D5
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 07:56:28 +0000
In-Reply-To: <cover.1524851673.git.lars.kurth@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjA0LjE4IGF0IDIwOjAxLCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToK
PiBUaGlzIGZvbGxvd3MgdXAgZnJvbSBhIGNvbnZlcnNhdGlvbiBhZnRlciB0aGUgQXByaWwgeDg2
IGNvbW11bml0eSBjYWxsLCBpbiAKPiB3aGljaCBJIGhhZAo+IHRoZSBmb2xsb3dpbmcgYWN0aW9u
OiBMYXJzIHRvIHByb3Bvc2UgZml4aW5nIENDIGlzc3VlIGluIHhlbi5naXQ6TUFJTlRBSU5FUlMg
Cj4gY29weWluZyAKPiB0aGUgUiBzZWN0aW9uIGVudHJpZXMgZnJvbSBMaW51eC5naXQ6TUFJTlRB
SU5FUlMgKHdpbGwgbmVlZCBjaGFuZ2VzIHRvIAo+IGdldF9tYWludGFpbmVycy5wbCBhbHNvKQo+
IAo+IE9uIDI3LzQvMTggSnVlcmdlbiBnYXZlIGEgUkFCIHZpYSBJUkMKPiAKPiBDYzogTGFycyBL
dXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1
LmNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
Pgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDYzogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDYzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFt
ZC5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBSZWxlYXNl
LWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQWNrZWQtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gTGFycyBLdXJ0aCAoMik6Cj4gICBBZGQg
QnJpYW4gV29vZHMgYXMgRGVzaWduYXRlZCByZXZpZXdlciB0byBBTUQgSU9NTVUgYW5kIEFNRCBT
Vk0KPiAgIEFkZCBEZXNpZ25hdGVkIFJldmlld2VyIChSOikgdG8gTUFJTlRBSU5FUlMgZmlsZSBh
bmQgYWRkIHN1cHBvcnQgZm9yCj4gICAgIGl0IGluIGdldF9tYWludGFpbmVyLnBsCgpUaGUgb3Jk
ZXIgb2YgdGhlIHBhdGNoZXMgaGFzIGJlZW4gdW5leHBlY3RlZGx5IHN3YXBwZWQsIGFuZCBzZWVt
cyB3cm9uZyB0bwptZSBub3c7IGdyYW50ZWQgdGhpcyBpcyBvbmx5IGNvc21ldGljIGlmIGJvdGgg
Z28gaW4gYXQgdGhlIHNhbWUgdGltZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
