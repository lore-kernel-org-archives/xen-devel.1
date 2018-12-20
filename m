From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Thu, 20 Dec 2018 02:07:46 -0700
Message-ID: <5C1B5BE20200007800207EF5@prv1-mh.provo.novell.com>
References: <20181123085402.663pdh75rhqtxsf4@mac>
 <67fa7dc6-3aff-a5fd-4105-dce19a89448c@bitdefender.com>
 <20181127113205.ohli6saatlwid7ua@mac>
 <516bea73-f88a-9f96-9619-fa32f9726dca@bitdefender.com>
 <4D445A680200003E34861ACF@prv1-mh.provo.novell.com>
 <DAD49D5A020000780063616D@prv1-mh.provo.novell.com>
 <5400A6CB0200003634861ACF@prv1-mh.provo.novell.com>
 <203C1A92020000400063616D@prv1-mh.provo.novell.com>
 <0DF3BC62020000E934861ACF@prv1-mh.provo.novell.com>
 <C6A2E442020000640063616D@prv1-mh.provo.novell.com>
 <6EEA58AB020000EA34861ACF@prv1-mh.provo.novell.com>
 <A956719C020000150063616D@prv1-mh.provo.novell.com>
 <838191050200006B34861ACF@prv1-mh.provo.novell.com>
 <A31948D30200007D0063616D@prv1-mh.provo.novell.com>
 <9B05ED9E020000C434861ACF@prv1-mh.provo.novell.com>
 <626A217B020000C50063616D@prv1-mh.provo.novell.com>
 <0D3C56BA0200004834861ACF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZuJ3-0004lx-U2
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 09:07:49 +0000
In-Reply-To: <0D3C56BA0200004834861ACF@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrei LUTAS <vlutas@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Mihai Dontu <mdontu@bitdefender.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEyLjE4IGF0IDE3OjQ5LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIDI3LjExLjIwMTggMTM6MzIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IFdvdWxk
IGl0IGJlIHBvc3NpYmxlIHRvIGFkZCBzb21lIGtpbmQgb2YgZmxhZyB0byB0aGUgZW11bGF0b3Ig
dG8KPj4gc2lnbmFsIHdoZXRoZXIgcDJtIHJlc3RyaWN0aW9ucyBzaG91bGQgYmUgZW5mb3JjZWQv
aWdub3JlZD8KPj4gaHZtZW11bF9hY3F1aXJlX3BhZ2Ugc2VlbXMgbGlrZSBhIHN1aXRhYmxlIHBs
YWNlLCBidXQgSSdtIG5vdCB0aGF0Cj4+IGZhbWlsaWFyIHdpdGggdGhlIGVtdWxhdG9yLgo+PiAK
Pj4gVGhlbiB5b3UgY291bGQgZ2VuZXJhdGUgdm0gZXZlbnRzIGZyb20gdGhlIGVtdWxhdG9yIGl0
c2VsZiwgd2hpY2gKPj4gQUZBSUNUIGlzIHRoZSBvbmx5IHdheSB0byBoYW5kbGUgdGhpcyBpbnN0
cnVjdGlvbiBleGVjdXRpb24gaXNzdWUuCj4gCj4gSSd2ZSBiZWVuIHRlc3Rpbmcgd2hhdCBwbGFj
ZSB3b3VsZCBiZSB0aGUgYmVzdCB0byBoYXZlIHRoZSBlbXVsYXRvciBzZW5kIAo+IGEgZXZlbnQg
YW5kIGl0IHR1cm5zIG91dCB0aGUgaHZtZW11bF9hY3F1aXJlX3BhZ2UgaXMgbm90IG9rLiBXaGF0
IHdvcmtlZCAKPiBmb3JtIG1lIHdhcyBoYXZpbmcgdGhlIGVtdWxhdG9yIHNlbmQgd3JpdGUgYWNj
ZXNzIHZpb2xhdGlvbnMgZnJvbSAKPiBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpLiBIZXJlIEkg
Y2FuIGdldCB0aGUgZ2ZuLCBnbGEgYW5kIG9mZnNldCBmb3IgCj4gdGhlIGV2ZW50Lgo+IAo+IEZv
ciB0aGUgZXhlYyBhY2Nlc3MgdmlvbGF0aW9uIEkndmUgdHJpZWQgdG8gc2VuZCBldmVudHMgZnJv
bSAKPiBodm1lbXVsX2luc25fZmV0Y2goKSBidXQgdGhlcmUgaXMgYSBwcm9ibGVtIHRvIGdldCB0
aGUgc2FtZSB2YXJpYWJsZXMgCj4gZm9yIHRoZSBldmVudC4gSXMgdGhlcmUgYSB3YXkgdG8gZ28g
YXJvdW5kIGFuZCBnZXQgdGhvc2UgcGFyYW1zIGZvciB0aGUgCj4gZXZlbnQ/IEFueSB0aG91Z2h0
cyBhcmUgYXBwcmVjaWF0ZWQuCgpPbmUgcXVlc3Rpb24gaXMgd2hldGhlciBfX2h2bWVtdWxfcmVh
ZCgpIGNvdWxkbid0IC8gc2hvdWxkbid0CmFsc28gYmUgc3dpdGNoZWQgdG8gdXNlIGh2bWVtdWxf
bWFwX2xpbmVhcl9hZGRyKCksIHdoaWNoIHdvdWxkCmFsbG93IHlvdXIgaW5zZXJ0aW9uIHRvIGxp
dmUgaW4gb25lIGNlbnRyYWwgcGxhY2UuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
