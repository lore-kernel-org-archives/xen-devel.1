From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm: Disallow unknown MSR_EFER bits
Date: Tue, 24 Jul 2018 04:13:28 -0600
Message-ID: <5B56FBC802000078001D71BF@prv1-mh.provo.novell.com>
References: <1532353790-28875-1-git-send-email-andrew.cooper3@citrix.com>
 <20180723141155.2uxuerocylw36p5l@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180723141155.2uxuerocylw36p5l@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA3LjE4IGF0IDE2OjExLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSnVsIDIzLCAyMDE4IGF0IDAyOjQ5OjUwUE0gKzAxMDAsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4+IEl0IHR1cm5zIG91dCB0aGF0IG5vdGhpbmcgZXZlciBwcmV2ZW50ZWQgSFZNIGd1
ZXN0cyBmcm9tIHRyeWluZyB0byBzZXQgCj4gdW5rbm93bgo+PiBFRkVSIGJpdHMuICBHZW5lcmFs
bHksIHRoaXMgcmVzdWx0cyBpbiBhIHZtZW50cnkgZmFpbHVyZS4KPj4gCj4+IEZvciBJbnRlbCBo
YXJkd2FyZSwgYWxsIGltcGxlbWVudGVkIGJpdHMgYXJlIGNvdmVyZWQgYnkgdGhlIGNoZWNrcy4K
Pj4gCj4+IEZvciBBTUQgaGFyZHdhcmUsIHRoZSBvbmx5IEVGRVIgYml0IHdoaWNoIGlzbid0IGNv
dmVyZWQgYnkgdGhlIGNoZWNrcyBpcyBUQ0UKPj4gKHdoaWNoIEFGQUlDVCBpcyBzcGVjaWZpYyB0
byBBTUQgRmFtMTUvMTYgaGFyZHdhcmUpLiAgV2UgbmV2ZXIgYWR2ZXJ0aXNlIFRDRQo+PiBpbiBD
UFVJRCwgYnV0IGl0IGlzbid0IGEgc2VjdXJpdHkgcHJvYmxlbSB0byBoYXZlIFRDRSB1bmV4cGVj
dGVkIGVuYWJsZWQgaW4KPj4gZ3Vlc3QgY29udGV4dC4KPj4gCj4+IERpc2FsbG93IHRoZSBzZXR0
aW5nIG9mIGJpdHMgb3V0c2lkZSBvZiB0aGUgRUZFUl9LTk9XTl9NQVNLLCB3aGljaCBwcmV2ZW50
cwo+PiBhbnkgdm1lbnRyeSBmYWlsdXJlcyBmb3IgZ3Vlc3RzLCB5aWVsZGluZyAjR1AgaW5zdGVh
ZC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
