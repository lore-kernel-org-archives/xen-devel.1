From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 02/12] x86: don't use hypervisor
 stack size for dumping guest stacks
Date: Tue, 23 Jan 2018 02:26:55 -0700
Message-ID: <5A670DEF02000078001A16AF@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edurB-0008Bu-Sf
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 09:27:05 +0000
In-Reply-To: <20180122123256.1431-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDEzOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBzaG93
X2d1ZXN0X3N0YWNrKCkgYW5kIGNvbXBhdF9zaG93X2d1ZXN0X3N0YWNrKCkgc3RvcCBkdW1waW5n
IHRoZQo+IHN0YWNrIG9mIHRoZSBndWVzdCB3aGVuZXZlciBpdHMgdmlydHVhbCBhZGRyZXNzIHJl
YWNoZXMgdGhlIHNhbWUKPiBhbGlnbm1lbnQgd2hpY2ggaXMgdXNlZCBmb3IgdGhlIGh5cGVydmlz
b3Igc3RhY2tzLgo+IAo+IFJlbW92ZSB0aGlzIGFyYml0cmFyeSBsaW1pdCBhbmQgdHJ5IHRvIGR1
bXAgYSBmaXhlZCBudW1iZXIgb2YgbGluZXMKPiBpbnN0ZWFkLgoKSG1tLCBJIGNhbiBzZWUgeW91
ciBwb2ludCwgYnV0IGJlZm9yZSBsb29raW5nIGF0IHRoZSBjaGFuZ2UgaW4gZGV0YWlsCkkgdGhp
bmsgd2UgbmVlZCB0byBhZ3JlZSBvbiB3aGF0IGJlaGF2aW9yIHdlIHdhbnQuIER1bXBpbmcKYXJi
aXRyYXJ5IGRhdGEgYXMgaWYgaXQgd2FzIGEgcGFydCBvZiB0aGUgc3RhY2sgaXNuJ3QgdmVyeSBo
ZWxwZnVsLCBsaW1pdGluZwp0aGUgcmlzayBvZiB3aGljaCBpcywgSSB0aGluaywgdGhlIHJlYXNv
biBmb3IgdGhlIHdheSB0aGluZ3MgY3VycmVudGx5CndvcmsgKGFzc3VtaW5nIHRoYXQgZ3Vlc3Qg
a2VybmVscyB3b24ndCBoYXZlIHN0YWNrcyBsYXJnZXIgdGhhbiBYZW4KaXRzZWxmLCBhbmQgdGhh
dCB0aGV5IHRvbyB3b3VsZCBhbGlnbiB0aGVtKS4gV2hhdCB3b3VsZCBwZXJoYXBzIGJlCmJldHRl
ciBpcyBmb3IgdGhlIGd1ZXN0IHRvIHN1cHBseSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcmVzdHJp
Y3Rpb25zIGl0CmVuZm9yY2VzIG9uIGl0cyBzdGFja3MsIHdoaWNoIFhlbiBjb3VsZCB0aGVuIHVz
ZSBoZXJlLiBJbiB0aGUKYWJzZW5jZSBvZiBzdWNoIGhpbnRzIHVzaW5nIHRoZSB2YWx1ZXMgY3Vy
cmVudGx5IGJlaW5nIHVzZWQgd291bGQKcG9zc2libHkgbWFrZSBzZW5zZS4KCkphbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
