From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v11 9/9] xen: explicit casts when
 DECLARE_BOUNDS cannot be used [and 1 more messages]
Date: Fri, 08 Mar 2019 01:28:29 -0700
Message-ID: <5C8227AD020000780015016A@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-9-git-send-email-sstabellini@kernel.org>
 <5C810314020000780021C706@prv1-mh.provo.novell.com><1551825512-8975-9-git-send-email-sstabellini@kernel.org>,
 <5C810314020000780021C706@prv1-mh.provo.novell.com>
 <23681.14338.969371.151047@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h2Arr-0002Iu-Jq
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 08:28:35 +0000
In-Reply-To: <23681.14338.969371.151047@mariner.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: ian.jackson@citrix.com, sstabellini@kernel.org
Cc: stefanos@xilinx.com, Andrew.Cooper3@citrix.com, julien.grall@arm.com, George.Dunlap@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiAwMy8wNy8xOSA0OjI2IFBN
ID4+Pgo+SmFuIHdyaXRlczoKPgo+PiBJIGRpc2FncmVlIHdpdGggdGhlIGNvbW1lbnQsCj4KPkkg
YWxzbyBkaXNhZ3JlZSB3aXRoIHRoZSB3b3JkaW5nIG9mIHRoZSBjb21tZW50LiAgSXQgaXMgc2Vy
aW91c2x5Cj5taXNsZWFkaW5nLiAgVGhlc2Ugc3ltYm9scyBkbyBpbiBmYWN0IHJlZmVyIHRvIHRo
ZSBzYW1lIG9iamVjdCEKPlRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIGNvbXBpbGVyIHRoaW5rcyBv
dGhlcndpc2UuICBZb3UgbmVlZCB3b3JkaW5nCj5saWtlIHRoYXQgaW4gREVDTEFSRV9CT1VORFMu
ICAoT3IgYSByZWZlcmVuY2UgdG8gaXQuKQo+Cj4+IGFuZCBpZiB5b3UgdGhpbmsgaXQgaXMgY29y
cmVjdCwgdGhlbiBubwo+PiBtYXR0ZXIgd2hhdCB5b3UgZG8gdGhlIGJlaGF2aW9yIGlzIHVuZGVm
aW5lZC4gSW5zdGVhZCBJIHZpZXcgdGhlCj4+IGVudGlyZXR5IG9mIHRoZSAuYnVnX2ZyYW1lcy4q
IHNlY3Rpb25zIGFzIGEgc2luZ2xlIGFycmF5LCB3aXRoCj4+IGxhYmVscyBwbGFjZWQgbm90IG9u
bHkgYXQgc3RhcnQgYW5kIGVuZCwgYnV0IGFsc28gaW4gdGhlIG1pZGRsZS4gSQo+PiB0aGluayB0
aGUgY29kZSBoZXJlIHdvdWxkIGJldHRlciBhbHNvIGJlIHRha2VuIGNhcmUgb2YgYnkgdGhlCj4+
IERFQ0xBUkVfQk9VTkRTKCkgbWFjaGluZXJ5LCBkaXZpZGluZyB0aGUgc2luZ2xlIGFycmF5IGlu
dG8KPj4gbXVsdGlwbGUgc21hbGxlciBvbmVzLgo+Cj5KYW4sIEknbSBub3Qgc3VyZSBleGFjdGx5
IHdoYXQgeW91IGFyZSBzdWdnZXN0aW5nLiAgQ3VycmVudGx5IHRoZQo+YXJyYXkgaGFzIG9uZSBw
b2ludGVyIHBlciBlbGVtZW50LiAgQXJlIHlvdSBzdWdnZXN0aW5nIGl0IHNob3VsZCBoYXZlCj50
d28gcG9pbnRlcnMgKHN0YXJ0IGFuZCBlbmQpLCB3aXRoIGRpZmZlcmVudCBub3Rpb25hbCB0eXBl
cyA/CgpZZXMuCgoKPklmIHRoYXQgaXMgT0sgZnJvbSBhIHBlcmYgcG9pbnQgb2YgdmlldyB0aGVu
IGl0IGlzIGFuIGVhc3kgYW5zd2VyCj4oYWx0aG91Z2ggYSBiaXQgdGlyZXNvbWUgc2luY2UgbW9y
ZSBsaW5rZXIgc3ltYm9scyB3aWxsIGhhdmUgdG8gYmUKPmdlbmVyYXRlZCkuCgpUaGlzIGlzIGlu
aXQtdGltZSBjb2RlIGFuZCBpbml0LXRpbWUgZGF0YSwgc28gdG8gbWUgbmVpdGhlciB0aGUgcGVy
Zm9ybWFuY2UKYXNwZWN0IG5vciB0aGUgZG91YmxlZCBzdG9yYWdlIHJlcXVpcmVtZW50cyB3b3Vs
ZCByZWFsbHkgbWF0dGVyLiBCb3RoCmNvdWxkIHBlcmhhcHMgZXZlbiBiZSBlbGltaW5hdGVkIGJ5
IHVzaW5nIGFuIGFycmF5IG9mIHVuaW9ucy4KCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
