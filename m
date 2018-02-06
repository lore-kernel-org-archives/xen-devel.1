From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] libxc: don't fail domain creation when
 unpacking initrd fails
Date: Tue, 6 Feb 2018 12:36:30 +0000
Message-ID: <20180206123630.jicwc7s4sgwhljrz@citrix.com>
References: <5A72CE5302000078001A433C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=y0p4=fa=citrix.com=prvs=56821041b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ej2Ui-0002Fo-Q8
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 12:37:04 +0000
Content-Disposition: inline
In-Reply-To: <5A72CE5302000078001A433C@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDEsIDIwMTggYXQgMTI6MjI6NDNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQXQgbGVhc3QgTGludXgga2VybmVscyBoYXZlIGJlZW4gYWJsZSB0byB3b3JrIHdpdGgg
Z3ppcC1lZCBpbml0cmQgZm9yCj4gcXVpdGUgc29tZSB0aW1lOyBpbml0cmQgY29tcHJlc3NlZCB3
aXRoIG90aGVyIG1ldGhvZHMgYXJlbid0IGV2ZW4gYmVpbmcKPiBhdHRlbXB0ZWQgdG8gdW5wYWNr
LiBGdXJ0aGVybW9yZSB0aGUgdW56aXAtaW5nIHJvdXRpbmUgdXNlZCBoZXJlIGlzbid0Cj4gY2Fw
YWJsZSBvZiBkZWFsaW5nIHdpdGggdmFyaW91cyBmb3JtcyBvZiBjb25jYXRlbmF0ZWQgZmlsZXMs
IGVhY2ggb2YKPiB3aGljaCB3YXMgZ3ppcC1lZCBzZXBhcmF0ZWx5IChpdCBpcyB0aGlzIHBhcnRp
Y3VsYXIgY2FzZSB3aGljaCBoYXMgYmVlbgo+IHRoZSBzb3VyY2Ugb2Ygb2JzZXJ2ZWQgVk0gY3Jl
YXRpb24gZmFpbHVyZXMpLgo+IAo+IEhlbmNlLCBpZiB1bnBhY2tpbmcgZmFpbHMsIHNpbXBseSBo
YW5kIHRoZSBjb21wcmVzc2VkIGJsb2IgdG8gdGhlIGd1ZXN0Cj4gYXMgaXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
