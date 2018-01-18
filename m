From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] x86/idt: Factor out enabling and
 disabling of ISTs
Date: Thu, 18 Jan 2018 00:43:49 -0700
Message-ID: <5A605E45020000780019FB34@prv-mh.provo.novell.com>
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-2-git-send-email-andrew.cooper3@citrix.com>
 <20180117144334.gcmpsv2uqjvc5is7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180117144334.gcmpsv2uqjvc5is7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE4IGF0IDE1OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBKYW4gMTIsIDIwMTggYXQgMDY6Mzc6MjBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gQWxsIGFsdGVyYXRpb24gb2YgSVNUIHNldHRpbmdzIChvdGhlciB0aGFuIHRoZSBj
cmFzaCBwYXRoKSBoYXBwZW4gaW4gYW4KPj4gaWRlbnRpY2FsIHRyaXBsZS4gIEludHJvZHVjZSBo
ZWxwZXJzIHRvIGtlZXAgdGhlIHRyaXBsZSBpbiBzeW5jLCBhbmQgcmVkdWNlCj4+IHRoZSByaXNr
IG9mIG9wZW5jb2RlZCBtaXN0YWtlcy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
