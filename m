From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Fri, 15 Feb 2019 11:08:41 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902151105580.5641@sstabellini-ThinkPad-X260>
References: <a49643ec-6bbe-04be-1ae2-b1d731da92cf@gmail.com>
 <20190213182544.2tguperv3yliejch@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902131110270.5641@sstabellini-ThinkPad-X260>
 <5C653AB10200007800216997@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902140938160.5641@sstabellini-ThinkPad-X260>
 <AB54071B-07B5-4FFC-A1A4-781C24F61D93@gmail.com>
 <20190215110807.jtybxyfl523vwo3y@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1275233104-1550257684=:5641"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190215110807.jtybxyfl523vwo3y@zion.uk.xensource.com>
Content-ID: <alpine.DEB.2.10.1902151108320.5641@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, Stefano Stabellini <sstabellini@kernel.org>, 'Jan Beulich' <JBeulich@suse.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Doug Goldstein <cardoe@cardoe.com>, Christopher Clark <christopher.w.clark@gmail.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, robin.randhawa@arm.com, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1275233104-1550257684=:5641
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.10.1902151108321.5641@sstabellini-ThinkPad-X260>

On Fri, 15 Feb 2019, Wei Liu wrote:
> On Thu, Feb 14, 2019 at 09:03:24PM +0000, Lars Kurth wrote:
> > 
> > 
> > > On 14 Feb 2019, at 18:32, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > 
> > > On Thu, 14 Feb 2019, Jan Beulich wrote:
> > >>>>> On 13.02.19 at 20:11, <sstabellini@kernel.org> wrote:
> > >>> On Wed, 13 Feb 2019, Wei Liu wrote:
> > >>>> On Tue, Feb 12, 2019 at 09:34:25PM -0500, Daniel P. Smith wrote:
> > >>>>> Greetings,
> > >>>>> 
> > >>>>> On the 11/14/18 Xen x86 community call a discussion was initiated about
> > >>>>> using Kconfig to build minimized versions of Xen for security, safety
> > >>>>> and other certification requirements. After some offline discussions
> > >>>>> with Xen contributors I realized that a variety of efforts each with
> > >>>>> their own respective goals are underway,
> > >>>>> 
> > >>>>> - nested virtualization
> > >>>>> - mixed criticality architectures
> > >>>>> - reducing trusted componentary
> > >>>>> - combining hardware protection of virtualization with performance and
> > >>>>> ease-of-use of containers
> > >>>>> 
> > >>>>> These efforts use hypervisors in different roles, all which Xen is
> > >>>>> capable of meeting. Today Xen's utility comes at the expense of carrying
> > >>>>> features necessary for one role to be present in another role where it
> > >>>>> is not required, e.g. PV interfaces that may not be essential in an ARM
> > >>>>> mixed criticality deployment.
> > >>>>> 
> > >>>>> The initial focus will be to explore and document the range of possible
> > >>>>> use cases that are of interest to the Xen community. This will be the
> > >>>>> input to a design document that is crafted in conjunction with the Xen
> > >>>>> maintainers, to identify possible approaches to extend the existing
> > >>>>> Kconfig infrastructure to produce tailored instances of Xen.
> > >>>>> 
> > >>>>> If you are interested in participating in this effort, please reply to
> > >>>>> this thread to outline possible use cases, design constraints and other
> > >>>>> considerations for improving Xen's Kconfig infrastructure to support
> > >>>>> tailoring for specific use cases.
> > >>>>> 
> > >>>> 
> > >>>> My impression from the community call is that you want to provide
> > >>>> smallish configurations for different use cases.
> > >>>> 
> > >>>> The Kconfig infrastructure is already able to do what you want as far as
> > >>>> I can tell.  You can easily feed it a base config file -- see files
> > >>>> under automation/configs/x86/.  What sort of extension is needed in your
> > >>>> opinion?
> > >>>> 
> > >>>> As use case goes, it would be a good start if you just submit something
> > >>>> you care about.
> > >>> 
> > >>> I mentioned on the call that a good first start could be a kconfig that
> > >>> allows to build an hypervisor binary with only support for PVH and only
> > >>> support for recent Intel machines, with the goal of minimizing the code
> > >>> base to less than 100K LOC.
> > >> 
> > >> "With only support for PVH" (which really means HVM) we already have.
> > >> "With only support for recent Intel machines" would require adding new
> > >> Kconfig options first, to control Intel, AMD, etc separately, and to then
> > >> further somehow separate "old" from "new" (which may turn out not
> > >> very easy to do without a lot of #ifdef-ary or other code churn). I'm
> > >> not aware of something like this existing on Linux either - all I'm aware
> > >> of there is a means to control what -m<arch> option might be passed
> > >> to the compiler, but without disabling any source code from getting
> > >> compiled.
> > > 
> > > I was thinking along the lines of having options to disable drivers for
> > > older timers and older interrupt controllers that are not needed on
> > > recent machines.
> > > 
> > > 
> > >> And then "with only support for recent Intel machines" could also imply
> > >> HAP-only; disabling shadow code (which also is already possible) will
> > >> alone save almost 10k LOC (counting .c files only).
> > > 
> > > I have just run `make cloc' on x86 with the smallest possible
> > > configuration (HVM only):
> > > 
> > > 
> > > http://cloc.sourceforge.net <http://cloc.sourceforge.net/> v 1.60  T=0.87 s (370.3 files/s, 255808.4 lines/s)
> > > -------------------------------------------------------------------------------
> > > Language                     files          blank        comment           code
> > > -------------------------------------------------------------------------------
> > > C                              309          33238          29432         157001
> > > Assembly                        14            466            531           2435
> > > -------------------------------------------------------------------------------
> > > SUM:                           323          33704          29963         159436
> > > -------------------------------------------------------------------------------
> > > 
> > > This is great! The last time I did the count it was above 220K LOC.  We
> > > should make more noise about this -- it is a major.
> > 
> > @Wei: the binary size data is not that impressive. Would it be possible to do the make cloc on HVM, PV and mixed?
> > I can include this into the PR for 4.12. Sorry for slightly hi-jacking the thread.
> 
> Not sure how Stefano got the 157k number. Here are some results from
> staging.

See my attached .config
--8323329-1275233104-1550257684=:5641
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME=my-config
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.10.1902151108040.5641@sstabellini-ThinkPad-X260>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=my-config

Iw0KIyBBdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBmaWxlOyBETyBOT1QgRURJ
VC4NCiMgWGVuL3g4NiA0LjEyLjAtcmMgQ29uZmlndXJhdGlvbg0KIw0KQ09O
RklHX1g4Nl82ND15DQpDT05GSUdfWDg2PXkNCkNPTkZJR19BUkNIX0RFRkNP
TkZJRz0iYXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVmY29uZmlnIg0KDQoj
DQojIEFyY2hpdGVjdHVyZSBGZWF0dXJlcw0KIw0KQ09ORklHX05SX0NQVVM9
OA0KIyBDT05GSUdfUFYgaXMgbm90IHNldA0KQ09ORklHX0hWTT15DQojIENP
TkZJR19TSEFET1dfUEFHSU5HIGlzIG5vdCBzZXQNCiMgQ09ORklHX0JJR01F
TSBpcyBub3Qgc2V0DQojIENPTkZJR19IVk1fRkVQIGlzIG5vdCBzZXQNCkNP
TkZJR19UQk9PVD15DQojIENPTkZJR19YRU5fR1VFU1QgaXMgbm90IHNldA0K
DQojDQojIENvbW1vbiBGZWF0dXJlcw0KIw0KQ09ORklHX0NPTVBBVD15DQpD
T05GSUdfQ09SRV9QQVJLSU5HPXkNCkNPTkZJR19IQVNfQUxURVJOQVRJVkU9
eQ0KQ09ORklHX0hBU19FWF9UQUJMRT15DQpDT05GSUdfTUVNX0FDQ0VTU19B
TFdBWVNfT049eQ0KQ09ORklHX01FTV9BQ0NFU1M9eQ0KQ09ORklHX0hBU19N
RU1fUEFHSU5HPXkNCkNPTkZJR19IQVNfTUVNX1NIQVJJTkc9eQ0KQ09ORklH
X0hBU19QRFg9eQ0KQ09ORklHX0hBU19VQlNBTj15DQpDT05GSUdfSEFTX0tF
WEVDPXkNCkNPTkZJR19IQVNfR0RCU1g9eQ0KQ09ORklHX0hBU19JT1BPUlRT
PXkNCkNPTkZJR19ORUVEU19MSUJFTEY9eQ0KIyBDT05GSUdfS0VYRUMgaXMg
bm90IHNldA0KQ09ORklHX1hFTk9QUk9GPXkNCiMgQ09ORklHX1hTTSBpcyBu
b3Qgc2V0DQpDT05GSUdfU0NIRURfQ1JFRElUPXkNCkNPTkZJR19TQ0hFRF9D
UkVESVQyPXkNCkNPTkZJR19TQ0hFRF9SVERTPXkNCiMgQ09ORklHX1NDSEVE
X0FSSU5DNjUzIGlzIG5vdCBzZXQNCkNPTkZJR19TQ0hFRF9OVUxMPXkNCkNP
TkZJR19TQ0hFRF9ERUZBVUxUPSJjcmVkaXQyIg0KQ09ORklHX0NSWVBUTz15
DQojIENPTkZJR19MSVZFUEFUQ0ggaXMgbm90IHNldA0KIyBDT05GSUdfU1VQ
UFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUyBpcyBub3Qgc2V0DQpD
T05GSUdfQ01ETElORT0iIg0KQ09ORklHX0RPTTBfTUVNPSIiDQoNCiMNCiMg
RGV2aWNlIERyaXZlcnMNCiMNCkNPTkZJR19BQ1BJPXkNCkNPTkZJR19BQ1BJ
X0xFR0FDWV9UQUJMRVNfTE9PS1VQPXkNCkNPTkZJR19OVU1BPXkNCkNPTkZJ
R19IQVNfTlMxNjU1MD15DQpDT05GSUdfSEFTX0VIQ0k9eQ0KQ09ORklHX0hB
U19DUFVGUkVRPXkNCkNPTkZJR19IQVNfUEFTU1RIUk9VR0g9eQ0KQ09ORklH
X0hBU19QQ0k9eQ0KIyBDT05GSUdfVkdBIGlzIG5vdCBzZXQNCkNPTkZJR19I
QVNfVlBDST15DQoNCiMNCiMgRGVwcmVjYXRlZCBGdW5jdGlvbmFsaXR5DQoj
DQpDT05GSUdfREVGQ09ORklHX0xJU1Q9ImFyY2gveDg2L2NvbmZpZ3MveDg2
XzY0X2RlZmNvbmZpZyINCkNPTkZJR19BUkNIX1NVUFBPUlRTX0lOVDEyOD15
DQoNCiMNCiMgRGVidWdnaW5nIE9wdGlvbnMNCiMNCiMgQ09ORklHX0RFQlVH
IGlzIG5vdCBzZXQNCg==

--8323329-1275233104-1550257684=:5641
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1275233104-1550257684=:5641--
