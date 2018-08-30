From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 7/7] x86/hvm: Drop hvm_{vmx,svm} shorthands
Date: Thu, 30 Aug 2018 19:11:37 -0400
Message-ID: <b47d0426-de6d-a042-26d8-db36a6e7e5dc@oracle.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-8-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535477946-17892-8-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMjgvMjAxOCAwMTozOSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBCeSBtYWtpbmcg
e3ZteCxzdm19IGluIGh2bV92Y3B1IGludG8gYW4gYW5vbnltb3VzIHVuaW9uIChjb25zaXN0ZW50
IHdpdGgKPiBkb21haW4gc2lkZSBvZiB0aGluZ3MpLCB0aGUgaHZtX3t2bXgsc3ZtfSBkZWZpbmVz
IGNhbiBiZSBkcm9wcGVkLCBhbmQgYWxsIGNvZGUKPiByZWZlciB0byB0aGUgY29ycmVjdGx5LW5h
bWVkIGZpZWxkcy4gIFRoaXMgbWVhbnMgdGhhdCB0aGUgZGF0YSBoaWVyYWNoeSBpcyBubwo+IGxv
bmdlciBvYnNjdXJlZCBmcm9tIGdyZXAvY3Njb3BlL3RhZ3MvZXRjLgo+Cj4gUmVmb3JtYXQgb25l
IGNvbW1lbnQgYW5kIHN3aXRjaCBvbmUgYm9vbF90IHRvIGJvb2wgd2hpbGUgbWFraW5nIGNoYW5n
ZXMuCj4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4KCkRvIHdlIHN0aWxsIHN1cHBvcnQg
cHJlLTQuNiBnY2M/IFRoZXkgaGF2ZSBhIGJ1ZyB0aGF0IGRvZXNuJ3QgYWxsb3cKaW5pdGlhbGl6
ZXJzIGZvciBhbm9ueW1vdXMgc3RydWN0cy91bmlvbnMuIEkgZG9uJ3Qga25vdyB3aGV0aGVyIHdl
IGhhdmUKYW55IGZvciB2bXgvc3ZtLCBidXQgSSB0aG91Z2h0IEknZCBtZW50aW9uIHRoaXMganVz
dCBpbiBjYXNlLgoKT3RoZXIgdGhhbiB0aGF0LCBmb3IgU1ZNIGJpdHMgaW4gcGF0Y2hlcyAzLDQs
NiBhbmQgNwoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
