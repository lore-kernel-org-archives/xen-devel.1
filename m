From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/sched: Re-position the
 domain_update_node_affinity() call during vcpu construction
Date: Fri, 7 Sep 2018 09:40:13 +0100
Message-ID: <20180907084013.6m52xuztsgmd7xui@zion.uk.xensource.com>
References: <1536242495-21173-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1536242495-21173-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMDYsIDIwMTggYXQgMDM6MDE6MzVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBhbGxvY192Y3B1KCkncyBjYWxsIHRvIGRvbWFpbl91cGRhdGVfbm9kZV9hZmZpbml0
eSgpIGhhcyBleGlzdGVkIGZvciBhIGRlY2FkZSwKPiBidXQgaXRzIGVmZm9ydCBpcyBtb3N0bHkg
d2FzdGVkLgo+IAo+IGFsbG9jX3ZjcHUoKSBpcyBjYWxsZWQgaW4gYSBsb29wIGZvciBlYWNoIHZj
cHUsIGJyaW5naW5nIHRoZW0gaW50byBleGlzdGVuY2UuCj4gVGhlIHZhbHVlcyBvZiB0aGUgYWZm
aW5pdHkgbWFza3MgYXJlIHN0aWxsIGRlZmF1bHQsIHdoaWNoIGlzIGFsbGNwdXMgaW4KPiBnZW5l
cmFsLCBvciBhIHByb2Nlc3NvciBzaW5nbGV0b24gZm9yIHBpbm5lZCBkb21haW5zLgo+IAo+IEZ1
cnRoZXJtb3JlLCBkb21haW5fdXBkYXRlX25vZGVfYWZmaW5pdHkoKSBpdHNlbGYgbG9vcHMgb3Zl
ciBhbGwgdmNwdXMKPiBhY2N1bXVsYXRpbmcgdGhlIG1hc2tzLCBtYWtpbmcgaXQgYSBzY2FsYWJp
bGl0eSBjb25jZXJuIHdpdGggbGFyZ2UgbnVtYmVycyBvZgo+IHZjcHVzLgo+IAo+IE1vdmUgaXQg
dG8gYmUgY2FsbGVkIG9uY2UgYWZ0ZXIgYWxsIHZjcHVzIGFyZSBjb25zdHJ1Y3RlZCwgd2hpY2gg
aGFzIHRoZSBzYW1lCj4gbmV0IGVmZmVjdCwgYnV0IHdpdGggZmV3ZXIgaW50ZXJtZWRpYXRlIG1l
bW9yeSBhbGxvY2F0aW9ucyBhbmQgbGVzcyBjcHVtYXNrCj4gYXJpdGhtZXRpYy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
