From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/vcpu: Remove struct vcpu allocation
 restriction when possible
Date: Mon, 5 Nov 2018 13:36:43 +0000
Message-ID: <20181105133643.dtzmrmvm3qbfnbnn@zion.uk.xensource.com>
References: <1541423850-8873-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1541423850-8873-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDE6MTc6MzBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGVyZSBpcyBubyBuZWVkIGZvciBzdHJ1Y3QgdmNwdSB0byBsaXZlIGJlbG93IHRo
ZSA0RyBib3VuZGFyeSBmb3IgUFYgZ3Vlc3RzLAo+IG9yIGZvciBIVk0gdmNwdXMgdXNpbmcgSEFQ
Lgo+IAo+IFBsdW1iIHN0cnVjdCBkb21haW4gaW50byBhbGxvY192Y3B1X3N0cnVjdCgpIHNvIHRo
ZSB4ODYgdmVyc2lvbiBjYW4gcXVlcnkgdGhlCj4gZG9tYWluJ3MgdHlwZSBhbmQgcGFnaW5nIHNl
dHRpbmdzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
